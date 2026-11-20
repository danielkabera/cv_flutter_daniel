
import 'package:flutter/material.dart';

class MembreFamille {
  final String nom;
  final String lien;
  final String details;
  final IconData icone;

  const MembreFamille({
    required this.nom,
    required this.lien,
    required this.details,
    required this.icone,
  });
}

class FamillePage extends StatelessWidget {
  const FamillePage({super.key});

  final List<MembreFamille> _membres = const [
    MembreFamille(
      nom: 'Parent / Tuteur 1',
      lien: 'Parent',
      details: 'Soutien familial et repère essentiel.',
      icone: Icons.person,
    ),
    MembreFamille(
      nom: 'Parent / Tuteur 2',
      lien: 'Parent',
      details: 'Soutien familial et repère essentiel.',
      icone: Icons.person_outline,
    ),
    MembreFamille(
      nom: 'Petite sœur',
      lien: 'Fratrie',
      details: 'Membre de la famille à Goma.',
      icone: Icons.family_restroom,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _membres.length,
      itemBuilder: (context, index) {
        final m = _membres[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            leading: CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
              foregroundColor: Colors.indigo,
              child: Icon(m.icone),
            ),
            title: Text(m.nom, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(m.lien, style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.w500)),
                const SizedBox(height: 2),
                Text(m.details),
              ],
            ),
          ),
        );
      },
    );
  }
}