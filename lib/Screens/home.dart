import 'package:etec_api/Models/users_class.dart';
import 'package:etec_api/Nets/controll_API.dart';
import 'package:flutter/material.dart';

class Myhome extends StatefulWidget {
  const Myhome({ Key? key }) : super(key: key);

  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  Future<User>? _future;
  @override
  void initState() {
    _future = UserService.getUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        centerTitle: true,
      ),
      body: FutureBuilder<User>(
        future: _future,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.data.length,
              itemBuilder: (context, index){
                var info = snapshot.data!.data[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage('${info.avatar}'),
                      ),
                    title: Text('${info.firstName} ${info.lastName}'),
                    subtitle: Text('${info.email}'),
                  ),
                );
              },
          );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: Icon(
        Icons.add,
        color: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}