import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();

  @override
  void dispose() {
    _nomCtrl.dispose();
    _emailCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  void _copier(String texte, String label) {
    Clipboard.setData(ClipboardData(text: texte));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label copié dans le presse-papiers')),
    );
  }

  void _envoyer() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Message prêt pour ${_nomCtrl.text.trim()}')),
      );
      _nomCtrl.clear();
      _emailCtrl.clear();
      _messageCtrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.location_on, color: Colors.indigo),
                title: const Text('Localisation'),
                subtitle: const Text('Goma, Nord-Kivu, RDC'),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.code, color: Colors.indigo),
                title: const Text('GitHub'),
                subtitle: const Text('github.com/justinkan243-gif'),
                trailing: IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () => _copier('https://github.com/justinkan243-gif', 'Lien GitHub'),
                ),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.email, color: Colors.indigo),
                title: const Text('Email'),
                subtitle: const Text('contact@bealive-media.local'),
                trailing: IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () => _copier('contact@bealive-media.local', 'Email'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Envoyer un message',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _nomCtrl,
                    decoration: const InputDecoration(labelText: 'Votre nom', border: OutlineInputBorder()),
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Entrez votre nom' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'Votre email', border: OutlineInputBorder()),
                    validator: (v) => (v == null || !v.contains('@')) ? 'Email invalide' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _messageCtrl,
                    maxLines: 3,
                    decoration: const InputDecoration(labelText: 'Message', border: OutlineInputBorder()),
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Écrivez un message' : null,
                  ),
                  const SizedBox(height: 14),
                  FilledButton.icon(
                    onPressed: _envoyer,
                    icon: const Icon(Icons.send),
                    label: const Text('Envoyer'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
