import 'package:flutter/material.dart';

void main() {
  runApp(const FileManagerApp());
}

class FileManagerApp extends StatelessWidget {
  const FileManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainDashboard(),
      },
    );
  }
}

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Manager'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Storage',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildStorageCard(
                icon: Icons.phone_android,
                title: 'Internal Storage',
                subtitle: 'Available: 45 GB / 128 GB',
                color: Colors.blue,
              ),
              const SizedBox(height: 16),
              _buildStorageCard(
                icon: Icons.sd_card,
                title: 'SD Card',
                subtitle: 'Available: 12 GB / 32 GB',
                color: Colors.orange,
              ),
              const SizedBox(height: 24),
              const Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: [
                  _buildCategoryItem(Icons.image, 'Images', Colors.purple),
                  _buildCategoryItem(Icons.video_collection, 'Videos', Colors.red),
                  _buildCategoryItem(Icons.audiotrack, 'Audio', Colors.teal),
                  _buildCategoryItem(Icons.description, 'Docs', Colors.blue),
                  _buildCategoryItem(Icons.download, 'Downloads', Colors.indigo),
                  _buildCategoryItem(Icons.archive, 'Archives', Colors.brown),
                  _buildCategoryItem(Icons.android, 'APKs', Colors.green),
                  _buildCategoryItem(Icons.more_horiz, 'More', Colors.grey),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Recent Files',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.insert_drive_file),
                    title: Text('File_${index + 1}.txt'),
                    subtitle: const Text('Just now'),
                    trailing: const Icon(Icons.more_vert),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStorageCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: 0.6,
              backgroundColor: color.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
            const SizedBox(height: 4),
            Text(subtitle),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label, Color color) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
