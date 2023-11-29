// Flutter imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unnamed/Model/users.model.dart';

// Project imports:
import 'package:unnamed/widgets/Contact/contact.widget.dart';
import '../../../util/exentions/colors.extentions.dart';

class Contact extends StatelessWidget {
  Contact({super.key});

  Future<List<Users>> getAllUsers() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      List<Users> usersList = querySnapshot.docs.map((doc) {
        return Users(
          id: doc.id,
          username: doc['username'],
          email: doc['email'],
        );
      }).toList();

      print(usersList);

      return usersList;
    } catch (error) {
      print('Error getting users: $error');
      return [];
    }
  }

  List<String> entries = <String>["A", "B", "C"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Contact",
          style: TextStyle(color: CustomColors.blackk),
        ),
        centerTitle: false,
        titleSpacing: 24,
      ),
      body: FutureBuilder<List<Users>>(
        future: getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Affiche un indicateur de chargement pendant que les données sont récupérées
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Gère les erreurs éventuelles lors de la récupération des données
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Affiche un message si aucune donnée n'est disponible
            return Center(child: Text('Aucun utilisateur disponible.'));
          } else {
            // Utilise la liste d'utilisateurs pour générer les widgets dans le ListView
            List<Users> usersList = snapshot.data!;
            return ListView.separated(
              itemCount: usersList.length,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              itemBuilder: (BuildContext context, int index) {
                Users user = usersList[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ContactWidget(user: user),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            );
          }
        },
      ),
    );
  }
}
