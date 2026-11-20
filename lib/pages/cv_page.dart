import 'package:flutter/material.dart';

class CvPage extends StatelessWidget {
  const CvPage({super.key});

  Widget _sectionCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.indigo),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            child,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // En-tête : photo, nom, titre / profil
          Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 48,
                    // Si tu ajoutes assets/images/profil.jpg dans pubspec.yaml :
                    // backgroundImage: AssetImage('assets/images/profil.jpg'),
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Daniel Kabera',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Étudiant en Informatique Appliquée à la Gestion • Créateur Multimédia & Développeur',
                    style: TextStyle(fontSize: 14, color: Color.fromARGB(137, 23, 53, 137)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Profil orienté développement logiciel, production audiovisuelle et création de projets numériques.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          // Formation
          _sectionCard(
            icon: Icons.school_outlined,
            title: 'Formation',
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Licence en Informatique Appliquée à la Gestion des Entreprises',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('ISIG — Goma'),
              ],
            ),
          ),

          // Expériences (stages, projets, emplois)
          _sectionCard(
            icon: Icons.work_outline,
            title: 'Expériences (Stages, Projets, Emplois)',
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• Production audiovisuelle, photo & vidéo (Be Alive)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Cadrage, montage, étalonnage et création de contenus.'),
                SizedBox(height: 10),
                Text(
                  '• Projets logiciels & web',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Applications desktop/web et projets mobiles en Flutter.'),
                SizedBox(height: 10),
                Text(
                  '• Gestion & accompagnement de sorties musicales',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Distribution numérique et coordination de projets artistiques.'),
              ],
            ),
          ),

          // Compétences techniques et linguistiques
          _sectionCard(
            icon: Icons.code,
            title: 'Compétences techniques et linguistiques',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Techniques',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    Chip(label: Text('Flutter / Dart')),
                    Chip(label: Text('Web & SQL')),
                    Chip(label: Text('Git & GitHub')),
                    Chip(label: Text('Photo / Vidéo / Montage')),
                  ],
                ),
                const SizedBox(height: 14),
                const Text(
                  'Linguistiques',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                const Text('• Français (courant)\n• Anglais (courant)'),
              ],
            ),
          ),

          // Centres d'intérêt
          _sectionCard(
            icon: Icons.interests_outlined,
            title: 'Centres d’intérêt',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                Chip(label: Text('Photographie & Vidéographie')),
                Chip(label: Text('Slam & Spoken Word')),
                Chip(label: Text('Webtoons & Cinéma')),
                Chip(label: Text('Rap français & Musique')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}