import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:igreja/src/components/buttons/register_button_cancel.dart';
import 'package:igreja/src/components/drop_menu_register_component.dart';
import 'package:igreja/src/model/member_model.dart';
import 'package:igreja/src/store/member_store.dart';
import 'package:igreja/src/themes/theme_colors.dart';
import 'package:igreja/src/themes/theme_cunstom.dart';
import 'package:igreja/src/util/piket_date.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class RegisterMember extends StatefulWidget {
  const RegisterMember({
    super.key,
    this.member,
  });

  final MemberModel? member;

  @override
  State<RegisterMember> createState() => _RegisterMemberState();
}

class _RegisterMemberState extends State<RegisterMember> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _surName = TextEditingController();
  final _dateOfBirthDay = TextEditingController();
  final _cpf = TextEditingController();
  final _age = TextEditingController();
  final _phone = TextEditingController();
  final _maritalStatus = TextEditingController();
  final _cep = TextEditingController();
  final _uf = TextEditingController();
  final _city = TextEditingController();
  final _address = TextEditingController();
  final _neighborhood = TextEditingController();
  final _congregation = TextEditingController();
  final _status = TextEditingController();
  final _dateOfBaptized = TextEditingController();
  final _obs = TextEditingController();
  bool _active = false;

  @override
  void dispose() {
    _name.dispose();
    _surName.dispose();
    _dateOfBirthDay.dispose();
    _cpf.dispose();
    _age.dispose();
    _phone.dispose();
    _maritalStatus.dispose();
    _cep.dispose();
    _uf.dispose();
    _city.dispose();
    _address.dispose();
    _neighborhood.dispose();
    _congregation.dispose();
    _status.dispose();
    _dateOfBaptized.dispose();
    _obs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.member != null) {
      _name.text = widget.member!.name;
      _surName.text = widget.member!.surname;
      _dateOfBirthDay.text = widget.member!.dateOfBirthDay;
      _cpf.text = widget.member!.cpf;
      _age.text = widget.member!.age.toString();
      _phone.text = widget.member!.phone;
      _maritalStatus.text = widget.member!.maritalStatus;
      _cep.text = widget.member!.cep;
      _uf.text = widget.member!.uf;
      _city.text = widget.member!.city;
      _address.text = widget.member!.address;
      _neighborhood.text = widget.member!.neighborhood;
      _congregation.text = widget.member!.congregation;
      _status.text = widget.member!.status;
      _dateOfBaptized.text = widget.member!.dateOfBaptized;
      _obs.text = widget.member!.obs;
      _active = widget.member!.baptized;
    }

    final controller = Provider.of<MemberStore>(context, listen: false);

    double width = MediaQuery.of(context).size.width / 1.3;
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
          child: Stack(
            children: [
              ListView(
                children: [
                  Column(
                    children: [
                      Text(
                        '${widget.member != null ? 'Atualizar' : 'Cadastrar Novo'} Membro',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      const SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  // Nome
                                  SizedBox(
                                    width: width * 0.7,
                                    child: TextFormField(
                                      validator: Validatorless.required(
                                          'O nome é obrigatório'),
                                      controller: _name,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[a-zA-ZÀ-ÿ\s]'))
                                      ],
                                      decoration: const InputDecoration(
                                        labelText: 'Nome',
                                        labelStyle: TextStyle(
                                            color: ThemeColors.blueTheme),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Apelido
                                      SizedBox(
                                        width: width * 0.306,
                                        child: TextFormField(
                                          controller: _surName,
                                          decoration: const InputDecoration(
                                            labelText: 'Apelido',
                                            labelStyle: TextStyle(
                                                color: ThemeColors.blueTheme),
                                          ),
                                        ),
                                      ),
                                      // Data de Nascimento
                                      SizedBox(
                                        width: width * 0.306,
                                        child: TextFormField(
                                          controller: _dateOfBirthDay,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            DataInputFormatter(),
                                          ],
                                          validator: Validatorless.multiple([
                                            Validatorless.required(
                                                'A data de nascimento é Obrigatoria')
                                          ]),
                                          //readOnly: true,
                                          mouseCursor: MaterialStateMouseCursor
                                              .clickable,
                                          decoration: InputDecoration(
                                            labelText: 'Data de nascimento',
                                            labelStyle: const TextStyle(
                                                color: ThemeColors.blueTheme),
                                            suffixIcon: IconButton(
                                              onPressed: () async {
                                                _dateOfBirthDay.text =
                                                    await PikerDate.piketDate(
                                                  context,
                                                );
                                              },
                                              icon: const Icon(Icons
                                                  .calendar_month_outlined),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // CPF
                                      SizedBox(
                                        width: width * 0.306,
                                        child: TextFormField(
                                          controller: _cpf,
                                          validator: Validatorless.multiple([
                                            Validatorless.cpf('CPF Invalido'),
                                          ]),
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            CpfInputFormatter()
                                          ],
                                          decoration: const InputDecoration(
                                            labelText: 'CPF',
                                            labelStyle: TextStyle(
                                                color: ThemeColors.blueTheme),
                                          ),
                                        ),
                                      ),
                                      // Idade
                                      SizedBox(
                                        width: width * 0.306,
                                        child: TextFormField(
                                          controller: _age,
                                          validator: Validatorless.required(
                                              'Idade é obrigatório'),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9]')),
                                            LengthLimitingTextInputFormatter(3)
                                          ],
                                          decoration: const InputDecoration(
                                            labelText: 'Idade',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Telefone
                                      SizedBox(
                                        width: width * 0.306,
                                        child: TextFormField(
                                          controller: _phone,
                                          validator: Validatorless.required(
                                              'Telefone é obrigatório'),
                                          keyboardType: TextInputType.phone,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            TelefoneInputFormatter(),
                                          ],
                                          decoration: const InputDecoration(
                                            labelText: 'Telefone',
                                            labelStyle: TextStyle(
                                                color: ThemeColors.blueTheme),
                                          ),
                                        ),
                                      ),
                                      // Estado Civil
                                      DropMenuRegisterComponent(
                                        width: width * 0.306,
                                        hintText: 'Estado Civil',
                                        list: const [
                                          DropdownMenuEntry(
                                              value: 0, label: ''),
                                          DropdownMenuEntry(
                                              value: 1, label: 'Solteiro'),
                                          DropdownMenuEntry(
                                              value: 2, label: 'Casado'),
                                        ],
                                        controller: _maritalStatus,
                                      ),
                                    ],
                                  ),
                                  const Divider(height: 20, thickness: 2),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // CEP
                                      SizedBox(
                                        width: width * 0.306,
                                        child: TextFormField(
                                          controller: _cep,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            CepInputFormatter(),
                                          ],
                                          decoration: const InputDecoration(
                                            labelText: 'CEP',
                                            labelStyle: TextStyle(
                                                color: ThemeColors.blueTheme),
                                          ),
                                        ),
                                      ),
                                      // UF
                                      DropMenuRegisterComponent(
                                        width: width * 0.306,
                                        hintText: 'UF',
                                        list: const [
                                          DropdownMenuEntry(
                                              value: 0, label: ('')),
                                          DropdownMenuEntry(
                                              value: 1, label: ('AC')),
                                          DropdownMenuEntry(
                                              value: 2, label: ('AL')),
                                          DropdownMenuEntry(
                                              value: 3, label: ('AP')),
                                          DropdownMenuEntry(
                                              value: 4, label: ('AM')),
                                          DropdownMenuEntry(
                                              value: 5, label: ('BA')),
                                          DropdownMenuEntry(
                                              value: 6, label: ('CE')),
                                          DropdownMenuEntry(
                                              value: 7, label: ('DF')),
                                          DropdownMenuEntry(
                                              value: 8, label: ('ES')),
                                          DropdownMenuEntry(
                                              value: 9, label: ('GO')),
                                          DropdownMenuEntry(
                                              value: 10, label: ('MA')),
                                          DropdownMenuEntry(
                                              value: 11, label: ('MT')),
                                          DropdownMenuEntry(
                                              value: 12, label: ('MS')),
                                          DropdownMenuEntry(
                                              value: 13, label: ('MG')),
                                          DropdownMenuEntry(
                                              value: 14, label: ('PA')),
                                          DropdownMenuEntry(
                                              value: 15, label: ('PB')),
                                          DropdownMenuEntry(
                                              value: 16, label: ('PR')),
                                          DropdownMenuEntry(
                                              value: 17, label: ('PE')),
                                          DropdownMenuEntry(
                                              value: 18, label: ('PI')),
                                          DropdownMenuEntry(
                                              value: 19, label: ('RJ')),
                                          DropdownMenuEntry(
                                              value: 20, label: ('RN')),
                                          DropdownMenuEntry(
                                              value: 21, label: ('RS')),
                                          DropdownMenuEntry(
                                              value: 22, label: ('RO')),
                                          DropdownMenuEntry(
                                              value: 23, label: ('RR')),
                                          DropdownMenuEntry(
                                              value: 24, label: ('SC')),
                                          DropdownMenuEntry(
                                              value: 25, label: ('SP')),
                                          DropdownMenuEntry(
                                              value: 26, label: ('SE')),
                                          DropdownMenuEntry(
                                              value: 27, label: ('TO')),
                                        ],
                                        controller: _uf,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Cidade
                                      SizedBox(
                                        width: width * 0.306,
                                        child: TextFormField(
                                          controller: _city,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[a-zA-ZÀ-ÿ\s]')),
                                          ],
                                          decoration: const InputDecoration(
                                            labelText: 'Cidade',
                                            labelStyle: TextStyle(
                                                color: ThemeColors.blueTheme),
                                          ),
                                        ),
                                      ),
                                      // Endereco
                                      SizedBox(
                                        width: width * 0.306,
                                        child: TextFormField(
                                          controller: _address,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[a-zA-ZÀ-ÿ\s]')),
                                          ],
                                          decoration: const InputDecoration(
                                            labelText: 'Endereço',
                                            labelStyle: TextStyle(
                                                color: ThemeColors.blueTheme),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Bairro
                                      SizedBox(
                                        width: width * 0.306,
                                        child: TextFormField(
                                          controller: _neighborhood,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[a-zA-ZÀ-ÿ\s]')),
                                          ],
                                          decoration: const InputDecoration(
                                            labelText: 'Bairro',
                                            labelStyle: TextStyle(
                                                color: ThemeColors.blueTheme),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Divider(height: 20, thickness: 2),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Congregacao
                                      DropMenuRegisterComponent(
                                        width: width * 0.306,
                                        hintText: 'Congregação',
                                        list: const [],
                                        controller: _congregation,
                                      ),
                                      // Batizado
                                      SizedBox(
                                        width: width * 0.306,
                                        child: TextFormField(
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            hintText: 'Batizado',
                                            labelText: 'Batizado',
                                            labelStyle: const TextStyle(
                                                color: ThemeColors.blueTheme),
                                            suffixIcon: SizedBox(
                                              child: Switch(
                                                value: _active,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _active = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Status
                                      DropMenuRegisterComponent(
                                        width: width * 0.306,
                                        hintText: 'Status',
                                        list: const [
                                          DropdownMenuEntry(
                                              value: 0, label: ''),
                                          DropdownMenuEntry(
                                              value: 1, label: 'Afastado'),
                                          DropdownMenuEntry(
                                              value: 2, label: 'Congregando'),
                                          DropdownMenuEntry(
                                              value: 2, label: 'Mudado'),
                                        ],
                                        controller: _status,
                                      ),
                                      // Data de Batismo
                                      SizedBox(
                                        width: width * 0.306,
                                        child: TextFormField(
                                          controller: _dateOfBaptized,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            DataInputFormatter(),
                                          ],
                                          enabled:
                                              _active == false ? false : true,
                                          //readOnly: true,
                                          decoration: InputDecoration(
                                            labelText: 'Data de Batismo',
                                            labelStyle: const TextStyle(
                                                color: ThemeColors.blueTheme),
                                            suffixIcon: IconButton(
                                              onPressed: () async {
                                                _dateOfBaptized.text =
                                                    await PikerDate.piketDate(
                                                  context,
                                                );
                                              },
                                              icon: const Icon(Icons
                                                  .calendar_month_outlined),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: width * 0.7,
                                    child: TextFormField(
                                      controller: _obs,
                                      decoration: const InputDecoration(
                                        labelText: 'OBS',
                                        labelStyle: TextStyle(
                                            color: ThemeColors.blueTheme),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.306,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: const Alignment(0.9, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Container(
                        height: height * 0.29,
                        width: width * 0.19,
                        color: Colors.white,
                        child: const Icon(
                          Icons.image,
                          size: 50,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            style: ThemeCunstom.themeCunstomButtonSave,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (widget.member != null) {
                                  controller.update(
                                    MemberModel(
                                        //image: 'image',
                                        name: _name.text,
                                        surname: _surName.text,
                                        cpf: _cpf.text,
                                        phone: _phone.text,
                                        dateOfBirthDay: _dateOfBirthDay.text,
                                        age: int.parse(_age.text),
                                        maritalStatus: _maritalStatus.text,
                                        cep: _cep.text,
                                        city: _city.text,
                                        neighborhood: _neighborhood.text,
                                        address: _address.text,
                                        uf: _uf.text,
                                        congregation: '_congregation.text',
                                        status: _status.text,
                                        baptized: _active,
                                        dateOfBaptized: _dateOfBaptized.text,
                                        obs: _obs.text),
                                  );
                                } else {
                                  controller.add(
                                    MemberModel(
                                        //image: 'image',
                                        name: _name.text,
                                        surname: _surName.text,
                                        cpf: _cpf.text,
                                        phone: _phone.text,
                                        dateOfBirthDay: _dateOfBirthDay.text,
                                        age: int.parse(_age.text),
                                        maritalStatus: _maritalStatus.text,
                                        cep: _cep.text,
                                        city: _city.text,
                                        neighborhood: _neighborhood.text,
                                        address: _address.text,
                                        uf: _uf.text,
                                        congregation: '_congregation.text',
                                        status: _status.text,
                                        baptized: _active,
                                        dateOfBaptized: _dateOfBaptized.text,
                                        obs: _obs.text),
                                  );
                                }

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Nova Membro!'),
                                  backgroundColor: Colors.green,
                                  duration: Duration(milliseconds: 3000),
                                  showCloseIcon: true,
                                  dismissDirection: DismissDirection.up,
                                ));
                                controller.findByMember();
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
                                  widget.member != null
                                      ? 'Atualizar'
                                      : 'Salvar',
                                  style: const TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const RegisterButtonCancel(
                            name: 'Cancelar',
                            icon: Icons.cancel_outlined,
                            backgroundColor: ThemeColors.redV),
                        const SizedBox(height: 5),
                        const SizedBox(height: 5),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
