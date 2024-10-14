import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:igreja/src/components/buttons/register_button_cancel.dart';
import 'package:igreja/src/components/drop_menu_register_component.dart';
import 'package:igreja/src/model/finances_model.dart';
import 'package:igreja/src/store/finances_store.dart';
import 'package:igreja/src/themes/theme_colors.dart';
import 'package:igreja/src/themes/theme_cunstom.dart';
import 'package:igreja/src/util/currency_ptbr_Inputformatter.dart';
import 'package:igreja/src/util/piket_date.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class RegisterFinancesExit extends StatefulWidget {
  const RegisterFinancesExit({
    super.key,
    this.finance,
  });

  final FinancesModel? finance;
  @override
  State<RegisterFinancesExit> createState() => _RegisterFinancesState();
}

class _RegisterFinancesState extends State<RegisterFinancesExit> {
  final _formKey = GlobalKey<FormState>();
  final description = TextEditingController();
  final value = TextEditingController();
  final date = TextEditingController();
  final wayToreceive = TextEditingController();
  final category = TextEditingController();

  @override
  void dispose() {
    description.dispose();
    value.dispose();
    date.dispose();
    category.dispose();
    wayToreceive.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FinancesStore>(context, listen: false);
    double width = MediaQuery.of(context).size.width / 2;
    double height = MediaQuery.of(context).size.height / 1.1;
    return Dialog(
      backgroundColor: ThemeColors.blueTheme,
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 30,
            top: 50,
            left: 30,
            bottom: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Cadastrar nova saída',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: description,
                      validator:
                          Validatorless.required('Descrição é obrigatório!'),
                      decoration: const InputDecoration(
                        labelText: 'Descrição',
                        labelStyle: TextStyle(
                          color: ThemeColors.blueTheme,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.438,
                          child: TextFormField(
                            controller: value,
                            validator:
                                Validatorless.required('Valor é obrigatório!'),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CurrencyPtBrInputFormatter(),
                            ],
                            decoration: const InputDecoration(
                              labelText: 'Valor',
                              labelStyle: TextStyle(
                                color: ThemeColors.blueTheme,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.438,
                          child: TextFormField(
                            controller: date,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              DataInputFormatter(),
                            ],
                            validator: Validatorless.multiple([
                              Validatorless.required(
                                  'A data da entrada é obrigatória')
                            ]),
                            //readOnly: true,
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            decoration: InputDecoration(
                              labelText: 'Data',
                              labelStyle:
                                  const TextStyle(color: ThemeColors.blueTheme),
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  date.text = await PikerDate.piketDate(
                                    context,
                                  );
                                },
                                icon: const Icon(Icons.calendar_month_outlined),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Categoria
                        DropMenuRegisterComponent(
                          width: width * 0.438,
                          hintText: 'Forma de recebimento',
                          list: const [
                            DropdownMenuEntry(value: 0, label: ('Espécie')),
                            DropdownMenuEntry(value: 1, label: ('Pix')),
                            DropdownMenuEntry(value: 2, label: ('Cartão')),
                          ],
                          controller: wayToreceive,
                        ),
                        DropMenuRegisterComponent(
                          width: width * 0.438,
                          hintText: 'Categorias',
                          list: const [
                            DropdownMenuEntry(value: 0, label: ('Ofertas')),
                            DropdownMenuEntry(value: 1, label: ('Dísimos')),
                            DropdownMenuEntry(value: 2, label: ('Outros')),
                          ],
                          controller: category,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ThemeCunstom.themeCunstomButtonSave,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (widget.finance != null) {
                            controller.update(
                              FinancesModel(
                                description: description.text,
                                value: double.parse(
                                      value.text
                                          .replaceAll(RegExp(r'[^0-9]'), ''),
                                    ) /
                                    100,
                                date: date.text,
                                wayToreceive: wayToreceive.text,
                                type: 'Saída',
                                category: category.text,
                              ),
                            );
                          } else {
                            controller.add(
                              FinancesModel(
                                description: description.text,
                                value: double.parse(value.text
                                        .replaceAll(RegExp(r'[^0-9]'), '')) /
                                    100,
                                date: date.text,
                                wayToreceive: wayToreceive.text,
                                type: 'Saída',
                                category: category.text,
                              ),
                            );
                          }

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              widget.finance != null
                                  ? 'Saída atualizada'
                                  : 'Nova saída adicionada',
                            ),
                            backgroundColor: Colors.green,
                            duration: const Duration(milliseconds: 3000),
                            showCloseIcon: true,
                            dismissDirection: DismissDirection.up,
                          ));
                          Navigator.pop(context);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.finance != null ? 'Atualizar' : 'Salvar',
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                  const RegisterButtonCancel(
                    name: 'Cancelar',
                    icon: Icons.cancel_outlined,
                    backgroundColor: ThemeColors.redV,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
