part of 'to_do_list.dart';

Widget taskInsertionSequence(){
  String title, description;
  DateTime selectedDate = DateTime.now();
  DateTime from = selectedDate, to = selectedDate;
  bool isDone;

  UniqueKey _formKey = UniqueKey();

  return Form(
    key: _formKey,
    child: Container(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(
                    "Enter Task Title"
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                child: Row(
                  children: [
                    const Text(
                      "From",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      DateFormat('EEE, MMM dd yyyy')
                          .format(from),
                    ),
                  ],
                ),
                onTap: () async {
                  selectedDate = await showDatePicker(
                    context: context,
                    initialDate: from,
                    firstDate: DateTime(DateTime.now().year),
                    lastDate: DateTime(2115),
                  ) as DateTime;
                  if(selectedDate!=from){
                    setState(() {
                      from = selectedDate;
                    });
                  }
                },
              ),
            ),
            const Divider(),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(
                    "Description"
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}