import 'dart:html';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Classe principal da aplicação, responsável por inicializar o MaterialApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      home: NubankHomePage(), // Página inicial definida como NubankHomePage
    );
  }
}

// Página principal representando a interface do Nubank
class NubankHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8A05BE), // Define cor primária da AppBar
        leading: Center(
          child: Ink(
            decoration: const ShapeDecoration(
              color: Color(0xFFBA4DE3), // Fundo circular para o ícone
              shape: CircleBorder(), // Formato circular
            ),
            child: IconButton(
              icon: Icon(Icons.person_outlined),
              color: Colors.white, // Ícone branco
              onPressed: () {}, // Ação ao clicar
            ),
          ),
        ),
        actions: [
          _buildAppBarIcon(Icons.visibility_outlined), // Botão de visibilidade
          _buildAppBarIcon(Icons.question_mark_rounded), // Botão de ajuda
          _buildAppBarIcon(Icons.mark_email_read_outlined), // Botão de mensagens
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Define padding em todo o corpo
        child: ListView(
          children: [
            _buildAccountSection(), // Seção de saldo
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30), // Espaçamento
              child: Divider(height: 1), // Linha divisória
            ),
            _buildCreditCardSection(), // Seção de cartão de crédito
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30), // Espaçamento
              child: Divider(height: 1),
            ),
            _buildLoanSection(), // Seção de empréstimo
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30), // Espaçamento
              child: Divider(height: 1),
            ),
            _buildDiscoverMoreSection(), // Seção de "Descubra agora"
          ],
        ),
      ),
    );
  }

  // Função para criar um ícone na AppBar
  Widget _buildAppBarIcon(IconData icon) {
    return IconButton(
      icon: Icon(icon, color: Color(0xFFF5F5F5)), // Ícone com cor clara
      onPressed: () {}, // Define ação ao clicar
    );
  }

  // Seção com saldo da conta e opções rápidas (PIX, pagamentos, etc.)
  Widget _buildAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Conta', style: _boldTextStyle(24)),
                const SizedBox(height: 10),
                const Text('R\$ 1.000,00', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
          ],
        ),
        _buildQuickActionsRow(), // Linha com ícones de ações rápidas
        const SizedBox(height: 30),
        _buildSimpleCard(Icons.credit_card, "Meus Cartões"), // Cartão de "Meus Cartões"
        _buildSimpleCard(
          null,
          "Guarde seu dinheiro em caixinhas",
          subtitle: "Acessando a área de planejamento",
        ),
      ],
    );
  }

  // Função que cria uma linha com ícones de ações rápidas
  Widget _buildQuickActionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildQuickAction(Icons.pix, "Área Pix"),
        _buildQuickAction(Icons.money, "Pagamentos"),
        _buildQuickAction(Icons.qr_code, "QR Code"),
        _buildQuickAction(Icons.attach_money, "Transferir"),
      ],
    );
  }

  // Função para criar um botão de ação rápida com ícone e texto
  Widget _buildQuickAction(IconData icon, String label) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0x20df40fb)),
          ),
          icon: Icon(icon),
          padding: const EdgeInsets.all(20),
        ),
        Text(label),
      ],
    );
  }

  // Seção com informações do cartão de crédito
  Widget _buildCreditCardSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cartão de Crédito', style: _boldTextStyle(24)),
            const SizedBox(height: 10),
            const Text('Fatura fechada', style: TextStyle(fontSize: 18, color: Colors.black54)),
            const SizedBox(height: 10),
            const Text('R\$ 500,00', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 15),
            const Text('Vencimento: 20/10', style: TextStyle(fontSize: 18, color: Colors.black54)),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Renegociar', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
      ],
    );
  }

  // Seção com informações de empréstimo
  Widget _buildLoanSection() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Empréstimo', style: _boldTextStyle(24)),
            const SizedBox(height: 10),
            const Text('Tudo certo com seu empréstimo atual.', style: TextStyle(fontSize: 18)),
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
      ],
    );
  }

  // Função que cria um cartão simples com ícone e texto
  Widget _buildSimpleCard(IconData? icon, String title, {String? subtitle}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            if (icon != null) Icon(icon),
            if (icon != null) const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                if (subtitle != null) Text(subtitle),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Seção "Descubra agora" com imagem e descrição
  Widget _buildDiscoverMoreSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Descubra agora", style: _boldTextStyle(24)),
        Card(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  'https://www.septe.com.br/wp-content/uploads/2024/01/planilha-matriz-9-box-jpg.webp',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Seguro de Vida', style: _boldTextStyle(20)),
                    const SizedBox(height: 5),
                    const Text('Cuide bem do que importa.', style: TextStyle(fontSize: 18, color: Colors.black54)),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Conhecer'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8A05BE),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Função auxiliar para criar TextStyle em negrito
  TextStyle _boldTextStyle(double size) {
    return TextStyle(fontSize: size, fontWeight: FontWeight.bold);
  }
}
