import 'package:flutter/material.dart';
import 'package:grimorio_arquitetura_mvc/controller/book_controller.dart';
import 'package:grimorio_arquitetura_mvc/models/personal_book_model.dart';
import 'package:grimorio_arquitetura_mvc/views/components/date_input.dart';
import 'package:grimorio_arquitetura_mvc/theme.dart';
import 'package:grimorio_arquitetura_mvc/views/components/entry.dart';

import 'components/display_text.dart';
import 'components/primary_button.dart';

class EditDetails extends StatefulWidget {
   EditDetails({super.key, required this.personalBook});

  PersonalBook personalBook;

  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController initialDateController = TextEditingController();
  final TextEditingController finalDateController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();

  final BookController controller = BookController();

  @override
  void initState() {
    super.initState();
    // Fill with book info
    if(widget.personalBook.comments != ""){
       commentsController.text = widget.personalBook.comments;
   }
    if(widget.personalBook.dayStarted != ""){
    initialDateController.text = widget.personalBook.dayStarted;
    }
    if(widget.personalBook.dayFinished != ""){
      finalDateController.text = widget.personalBook.dayFinished;
     }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: AppBackgroundProperties.boxDecoration,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(backgroundColor: AppColors.black,),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: DisplayText("Editando o Livro"),
                ),
                SizedBox(
                  width: 244,
                  child: Column(
                    children: <Widget>[
                      Entry(googleBook: widget.personalBook.googleBook),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: DateInput(textController: initialDateController, label: "Início da Leitura"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: DateInput(textController: finalDateController, label: "Final da Leitura"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: TextFormField(
                                controller: commentsController,
                                decoration:
                                  InputDecorationProperties.newInputDecoration(
                                  "",
                                  "Comentários",
                                ),
                                maxLines: 5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 40.0),
                              child: PrimaryButton(text: "Salvar", onTap: () {
                                //criar um novo PersonalBook
                                final PersonalBook newPersonal = PersonalBook(
                                  dayStarted: initialDateController.text,
                                  dayFinished: finalDateController.text,
                                  comments: commentsController.text,
                                  googleBook: widget.personalBook.googleBook, id: widget.personalBook.id
                                );
                                controller.updateBook(newPersonal);

                                Navigator.pop(context, newPersonal);
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

