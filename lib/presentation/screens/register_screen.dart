import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100,),
              SizedBox(height: 20,),
              _RegisterForm(),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}


class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            labelMessage: 'Nombre de Usuario',
            onChanged: (value) => username = value,
            validator: (value) {
              if( value == null || value.isEmpty ) return 'Campo requerido';
              if( value.trim().isEmpty ) return 'Campo requerido';
              if( value.length < 6 ) return 'Mas de 6 letras';
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            labelMessage: 'Correo Electronico',
            onChanged: (value) => email = value,
            validator: (value) {
              if( value == null || value.isEmpty ) return 'Campo requerido';
              if( value.trim().isEmpty ) return 'Campo requerido';
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if( !emailRegExp.hasMatch(value) ) return 'No tiene formato de correo';
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            labelMessage: 'Contraseña',
            onChanged: (value) => password = value,
            validator: (value) {
              if( value == null || value.isEmpty ) return 'Campo requerido';
              if( value.trim().isEmpty ) return 'Campo requerido';
              if( value.length < 6 ) return 'Mas de 6 letras';
              return null;
            },
            obscureText: true,
            
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
                onPressed: (){
                  final isValid = _formKey.currentState!.validate();
                  if( !isValid ) return;
                  print('$username, $email, $password');
                }, 
                icon: const Icon(Icons.save),
                label: const Text('Crear usuario'),
              ),
        ],
      )
    );
  }
}