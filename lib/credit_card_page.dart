import 'package:credit_card/add_card.dart';
import 'package:credit_card/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'get_cards.dart';
import 'joinUs/login.dart';

class CreditCardPage extends StatelessWidget {
  const CreditCardPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleSection(context),
              const SizedBox(
                height: 30,
              ),
              _buildCreditCard(
                  color: const Color(0xFF000000),
                  cardExpiration: '05/2021',
                  cardHolderName: 'Ben Foakes',
                  cardNumber: '2654 4589 XXXX 9856'),
              const SizedBox(
                height: 10,
              ),
              _buildCreditCard(
                  color: Colors.blue,
                  cardExpiration: '07/2023',
                  cardHolderName: 'Philip ',
                  cardNumber: '4568 9856 XXXX 1236'),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddCard(),
                      ),
                    );
                  },
                  child: const Text(
                    'Add Card',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Cards()));
                  },
                  child: const Text(
                    'Get Card',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection(BuildContext context) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Payment Details",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Apimanager().logOutUser();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => Login()),
                          (route) => false);
                    },
                    icon: const Icon(Icons.logout),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text(
                "How would you like to pay?",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black26),
              ),
            ),
          ],
        ),
      );
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
