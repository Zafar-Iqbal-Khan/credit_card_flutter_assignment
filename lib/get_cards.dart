import 'package:credit_card/services/api_services.dart';
import 'package:flutter/material.dart';

import 'models/get_cards_model.dart';

class Cards extends StatefulWidget {
  Cards({Key? key}) : super(key: key);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  late Future<GetCards> futureCards;
  @override
  void initState() {
    super.initState();
    futureCards = Apimanager().getCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// drawer: NavigationDrawerWidget(),

      body: FutureBuilder(
        future: futureCards,
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Result> cards = snapshot.data.results;
            return ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCreditCard(
                            color: Colors.black,
                            cardExpiration: cards[index].cardExpiration,
                            cardHolderName: cards[index].cardHolder,
                            cardNumber: cards[index].cardNumber),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildCreditCard({
    Color? color,
    String? cardExpiration,
    String? cardHolderName,
    String? cardNumber,
  }) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          14,
        ),
      ),
      child: Container(
        height: 230,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLogosBlock(),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: _cardNumber(cardNumber),
            ),
            _buildDetailsBlock(cardHolderName, cardExpiration)
          ],
        ),
      ),
    );
  }

  Text _cardNumber(String? cardNumber) {
    return Text(
      cardNumber!,
      style: const TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    );
  }

  Row _buildDetailsBlock(String? cardHolderName, String? cardExpiration) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CARDHOLDER',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Lato',
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              cardHolderName!,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'VALID THRU',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              cardExpiration!,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }

  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/contact_less.png',
          height: 20,
          width: 18,
        ),
        Image.asset(
          'assets/images/mastercard.png',
          height: 50,
          width: 50,
        ),
      ],
    );
  }
}
