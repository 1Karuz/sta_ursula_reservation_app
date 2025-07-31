import 'package:flutter/material.dart';

void main() {
  runApp(const ChurchReservationApp());
}

class ChurchReservationApp extends StatelessWidget {
  const ChurchReservationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Church Reservation',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _weddingController = PageController();
  final PageController _christeningController = PageController();
  final PageController _funeralController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 255, 255, 255), // background color
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.menu, size: 28),
                  const SizedBox(width: 16),
                  const Text(
                    'Menu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: const AssetImage('assets/profile.avif'),
                    backgroundColor: Colors.grey[300],
                    // child: Icon(Icons.person, color: Colors.grey[600]), // icon if no profile picture
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/church.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 6),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 18), // Left and right padding
              // child: Text(
              //   'Reserving your church services has never been easier. Whether it’s a joyous wedding, a blessed christening, or a solemn funeral, our app ensures your sacred moments are handled with care, dignity, and convenience.',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //       // fontStyle: FontStyle.italic,
              //       color: Colors.black),
              // ),
            ),

            // Center(
            //   child: Container(
            //     width: double.infinity,
            //     // margin: const EdgeInsets.symmetric(horizontal: 16),
            //     // child: ElevatedButton(
            //     //   onPressed: () {
            //     //     Navigator.push(
            //     //       context,
            //     //       MaterialPageRoute(
            //     //         builder: (context) => const ReservationScreen(),
            //     //       ),
            //     //     );
            //     //   },
            //     //   style: ElevatedButton.styleFrom(
            //     //     backgroundColor: Colors.grey[600],
            //     //     foregroundColor: Colors.white,
            //     //     padding: const EdgeInsets.symmetric(vertical: 16),
            //     //     shape: RoundedRectangleBorder(
            //     //       borderRadius: BorderRadius.circular(8),
            //     //     ),
            //     //   ),
            //     //   child: const Text(
            //     //     'Book Reservation',
            //     //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            //     //   ),
            //     // ),
            //   ),
            // ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildServiceCard(
                    'Wedding',
                    _weddingController,
                    'assets/wedding.avif',
                  ),
                  const SizedBox(height: 20),
                  _buildServiceCard(
                    'Christening',
                    _christeningController,
                    'assets/christening.jpg',
                  ),
                  const SizedBox(height: 20),
                  _buildServiceCard(
                    'Funeral',
                    _funeralController,
                    'assets/funeral.jpeg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(
      String title, PageController controller, String imagePath) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: Stack(
            children: [
              PageView(
                controller: controller,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 8,
                top: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const SizedBox(
                    width: 40,
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 8,
                top: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const SizedBox(
                    width: 40,
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReservationScreen(serviceType: title),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[700],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Book Now!',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}

// The rest of the widgets (ReservationScreen, SuccessScreen, etc.) should also have `const` added where applicable
// Let me know if you want me to continue optimizing the rest!
class ReservationScreen extends StatefulWidget {
  final String? serviceType;

  const ReservationScreen({super.key, this.serviceType});

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _emailController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.menu, size: 28),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Reservation',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            // Form
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      if (widget.serviceType != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            'Book ${widget.serviceType}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      _buildTextField(
                        controller: _nameController,
                        hintText: 'Name:',
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        controller: _contactController,
                        hintText: 'Contact No.',
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your contact number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your email';
                          }
                          if (!value!.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: _selectDate,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[400]!),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Text(
                                _selectedDate == null
                                    ? 'date:'
                                    : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: _selectedDate == null
                                      ? Colors.grey[600]
                                      : Colors.black87,
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.calendar_today,
                                  color: Colors.grey),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Book Now!',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[600]),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _selectedDate != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SuccessScreen()),
      );
    } else if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a date')),
      );
    }
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.menu, size: 28),
                  const SizedBox(width: 16),
                  const Text(
                    'Reservation',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            // Success Content
            Expanded(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CustomPaint(
                          painter: PartyIconPainter(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Book Success!!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[700],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Go Home',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PartyIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    paint.color = Colors.orange;
    final hatPath = Path()
      ..moveTo(size.width * 0.3, size.height * 0.8)
      ..lineTo(size.width * 0.5, size.height * 0.2)
      ..lineTo(size.width * 0.7, size.height * 0.8)
      ..close();
    canvas.drawPath(hatPath, paint);

    paint.color = Colors.red;
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.3), 3, paint);

    paint.color = Colors.blue;
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.4), 3, paint);

    paint.color = Colors.yellow;
    canvas.drawCircle(Offset(size.width * 0.1, size.height * 0.6), 3, paint);

    paint.color = Colors.green;
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.7), 3, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
