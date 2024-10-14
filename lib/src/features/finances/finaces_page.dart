import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:igreja/src/components/buttons/table_button.dart';
import 'package:igreja/src/components/cards/card_component.dart';
import 'package:igreja/src/components/dialogs/confirm_dialog.dart';
import 'package:igreja/src/components/filtteries/drop_menu_component.dart';
import 'package:igreja/src/features/finances/register_add_exit_finances.dart';
import 'package:igreja/src/features/finances/register_add_finances.dart';
import 'package:igreja/src/model/finances_model.dart';
import 'package:igreja/src/store/finances_store.dart';
import 'package:igreja/src/themes/theme_colors.dart';
import 'package:provider/provider.dart';

class FinancesPage extends StatelessWidget {
  const FinancesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FinancesStore>(context, listen: false);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 20),
        child: Column(
          children: [
            Observer(
              builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardComponent(
                      color: ThemeColors.greenV,
                      text: 'Entradas do mês',
                      value: controller.entri,
                    ),
                    CardComponent(
                      color: ThemeColors.redV,
                      text: 'Saídas do mês',
                      value: controller.exit,
                    ),
                    CardComponent(
                      color: ThemeColors.blueV,
                      text: 'Saldo do mês',
                      value: controller.saldo,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 25),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropMenuComponent(
                  width: 10,
                  hintText: 'Buscar por data',
                  leadingIcon: Icon(
                    Icons.filter_list_alt,
                    color: Colors.white,
                  ),
                  list: [
                    DropdownMenuEntry(value: 0, label: ''),
                    DropdownMenuEntry(value: 1, label: 'Solteiro'),
                    DropdownMenuEntry(value: 2, label: 'Casado'),
                  ],
                ),
                DropMenuComponent(
                  width: 10,
                  hintText: 'Buscar por categoria',
                  leadingIcon: Icon(
                    Icons.filter_list_alt,
                    color: Colors.white,
                  ),
                  list: [
                    DropdownMenuEntry(value: 0, label: ''),
                    DropdownMenuEntry(value: 1, label: 'PIB'),
                    DropdownMenuEntry(value: 2, label: 'Camurim'),
                    DropdownMenuEntry(value: 2, label: 'Alto Ferrão'),
                    DropdownMenuEntry(value: 2, label: 'Tabuleiro'),
                    DropdownMenuEntry(value: 2, label: 'Corrego'),
                  ],
                ),
                DropMenuComponent(
                  width: 10,
                  hintText: 'Buscar por tipo',
                  leadingIcon: Icon(
                    Icons.filter_list_alt,
                    color: Colors.white,
                  ),
                  list: [
                    DropdownMenuEntry(value: 0, label: ''),
                    DropdownMenuEntry(value: 1, label: 'Afastado'),
                    DropdownMenuEntry(value: 2, label: 'Congregando'),
                    DropdownMenuEntry(value: 2, label: 'Mudado'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            Expanded(
              child: FutureBuilder(
                future: controller.findByAll(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  } else {
                    return Observer(builder: (context) {
                      List<FinancesModel> m = controller.finances;
                      return DataTable2(
                        empty: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Não ha Finanças",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.assignment_late_outlined,
                                color: Colors.white,
                                size: 50,
                              )
                            ],
                          ),
                        ),
                        isHorizontalScrollBarVisible: false,
                        showCheckboxColumn: false,
                        minWidth: 900,
                        columns: const [
                          DataColumn2(
                              label: Center(child: Text('Tipo')),
                              fixedWidth: 70),
                          DataColumn2(
                              label:
                                  Center(child: Text('Forma de recebimento')),
                              size: ColumnSize.S),
                          DataColumn2(
                              label: Center(child: Text('Descrição')),
                              size: ColumnSize.M),
                          DataColumn2(
                              label: Center(child: Text('Valor')),
                              size: ColumnSize.S),
                          DataColumn2(
                              label: Center(child: Text('Date')),
                              size: ColumnSize.S),
                          DataColumn2(label: Text(''), fixedWidth: 50),
                          DataColumn2(label: Text(''), fixedWidth: 50),
                        ],
                        rows: List<DataRow>.generate(
                          m.length,
                          (index) {
                            return DataRow(
                              cells: [
                                DataCell(Center(
                                    child: Text(
                                  m[index].type,
                                  style: m[index].type == 'Entrada'
                                      ? const TextStyle(
                                          color: ThemeColors.greenV)
                                      : const TextStyle(
                                          color: ThemeColors.redV),
                                ))),
                                DataCell(
                                    Center(child: Text(m[index].wayToreceive))),
                                DataCell(
                                    Center(child: Text(m[index].description))),
                                DataCell(Center(
                                    child: Text(m[index].value.toString()))),
                                DataCell(Center(child: Text(m[index].date))),
                                const DataCell(Center(
                                    child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ))),
                                DataCell(
                                  const Center(
                                      child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                                  onTap: () {
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return ConfirmDialog(
                                          title:
                                              'Tem certeza que deseja excluir essa transação',
                                          action: controller,
                                          help: m[index],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TableButton(
                    name: 'Adicionar Entrada',
                    icon: Icons.person_add_alt_1_outlined,
                    backgroundColor: ThemeColors.greenV,
                    action: RegisterFinances(),
                  ),
                  const SizedBox(width: 25),
                  const TableButton(
                    name: 'Adicionar Saída',
                    icon: Icons.person_add_alt_1_outlined,
                    backgroundColor: ThemeColors.redV,
                    action: RegisterFinancesExit(),
                  ),
                  const SizedBox(width: 25),
                  TableButton(
                    name: 'Emitir Relatório',
                    icon: Icons.description_outlined,
                    backgroundColor: ThemeColors.blueV,
                    action: Container(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
