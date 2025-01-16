// En lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'design/add_drawer.dart';
import 'design/display_snackbar.dart';
import 'design/export_fonts.dart';
import 'design/update_ui_orientation.dart';
import 'design/use_custom_fonts.dart';
import 'design/use_themes.dart';
import 'design/work_with_tabs.dart';
import 'images/display_internet_images.dart';
import 'images/fade_in_images.dart';
import 'images/cached_images.dart';
import 'lists/grid_list.dart';
import 'lists/mixed_list.dart';
import 'lists/floating_app_bar.dart';
import 'lists/long_lists.dart';
import 'forms/form_validation.dart';
import 'forms/styled_text_field.dart';
import 'forms/focus_text_field.dart';
import 'forms/text_field_changes.dart';
import 'navigation/hero_animation.dart';
import 'navigation/basic_navigation.dart';
import 'navigation/named_routes.dart';
import 'navigation/pass_arguments.dart';
import 'navigation/return_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sections = [
      {
        'title': 'Diseño',
        'routes': [
          {'name': 'Agregar un drawer', 'widget': AddDrawerScreen()},
          {'name': 'Mostrar un snackbar', 'widget': DisplaySnackbarScreen()},
          {'name': 'Exportar fuentes', 'widget': ExportFontsScreen()},
          {'name': 'Actualizar la UI basada en orientación', 'widget': UpdateUIOrientationScreen()},
          {'name': 'Usar fuentes personalizadas', 'widget': UseCustomFontsScreen()},
          {'name': 'Usar temas', 'widget': UseThemesScreen()},
          {'name': 'Trabajar con pestañas', 'widget': WorkWithTabsScreen()},
        ]
      },
      {
        'title': 'Imágenes',
        'routes': [
          {'name': 'Mostrar imágenes de internet', 'widget': DisplayInternetImagesScreen()},
          {'name': 'Desvanecer imágenes con un placeholder', 'widget': FadeInImagesScreen()},
          {'name': 'Trabajar con imágenes en caché', 'widget': CachedImagesScreen()},
        ]
      },
      {
        'title': 'Listas',
        'routes': [
          {'name': 'Crear una lista de cuadrícula', 'widget': GridListScreen()},
          {'name': 'Crear listas con diferentes tipos de elementos', 'widget': MixedListScreen()},
          {'name': 'Colocar una barra de aplicación flotante sobre una lista', 'widget': FloatingAppBarScreen()},
          {'name': 'Trabajar con listas largas', 'widget': LongListsScreen()},
        ]
      },

      {

        'title' : 'Formularios',
        'routes': [
          {'name': 'Construir un formulario con validación', 'widget': FormValidationScreen()},
          {'name': 'Crear y estilizar un campo de texto', 'widget': StyledTextFieldScreen()},
          {'name': 'Enfoque y campos de texto', 'widget': FocusTextFieldScreen()},
          {'name': 'Manejar cambios en un campo de texto', 'widget': TextFieldChangesScreen()},

        ]
      },

      {

        'title' : 'Navegacion',
         'routes' : [
          {'name': 'Animar un widget entre pantallas', 'widget': HeroAnimationScreen()},
          {'name': 'Navegar a una nueva pantalla y volver', 'widget': BasicNavigationScreen()},
          {'name': 'Navegar con rutas con nombre', 'widget': NamedRoutesScreen()},
          {'name': 'Pasar argumentos a una ruta con nombre', 'widget': PassArgumentsScreen()},
          {'name': 'Devolver datos de una pantalla', 'widget': ReturnDataScreen()},
         ]
         
      }

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cookbook Alejandro'),
      ),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];
          return ExpansionTile(
            title: Text(section['title'] as String),
            children: (section['routes'] as List<Map<String, dynamic>>).map((route) {
              return ListTile(
                title: Text(route['name'] as String),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => route['widget'] as Widget),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}