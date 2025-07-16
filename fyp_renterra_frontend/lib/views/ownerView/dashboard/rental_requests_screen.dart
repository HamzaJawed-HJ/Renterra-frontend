import 'package:flutter/material.dart';

class RentalRequestsScreen extends StatelessWidget {
  final List<Map<String, String>> sampleRequests = [
    {
      'product': 'Toyota Corolla',
      'price': 'Rs 1500/day',
      'name': 'Ali Raza',
      'location': 'Karachi',
      'email': 'ali@example.com',
      'status': 'Accepted',
      'image': 'Pending'
    },
    {
      'product': 'Honda Civic',
      'price': 'Rs 1800/day',
      'name': 'Usman Tariq',
      'location': 'Lahore',
      'email': 'usman@example.com',
      'status': 'Pending',
      'image': 'Pending'
    },
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'Accepted':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Rental Requests',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatusBox("2", "Total Requests", Colors.blue),
                _buildStatusBox("10", "Pending", Colors.orange),
                _buildStatusBox("1", "Accepted", Colors.green),
              ],
            ),
            SizedBox(height: 30),
            Text("Rental Requests",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: sampleRequests.length,
                itemBuilder: (context, index) {
                  var req = sampleRequests[index];
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  backgroundImage: NetworkImage(
                                req['image']!,
                              )
                                  //radius: 24,
                                  ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(req['product']!,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color:
                                                getStatusColor(req['status']!),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Text(req['status']!,
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text(req['price']!,
                                        style: TextStyle(
                                            color: Colors.blue[700],
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(),
                          SizedBox(height: 10),
                          Text("Renter Information",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.person, size: 20),
                              SizedBox(width: 6),
                              Text("${req['name']} - ${req['location']}",
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.email, size: 20),
                              SizedBox(width: 6),
                              Text(req['email']!,
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 10),
                          if (req['status'] == 'Accepted')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 14, bottom: 10),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(double.infinity, 40),
                                    backgroundColor: Colors.blue[400],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline_rounded,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Rental Confirmed",
                                          style: TextStyle(
                                              fontSize: 16,
                                              letterSpacing: 2,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          else if (req['status'] == 'Pending')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 14, bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      child: Text("Accept",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      child: Text("Decline",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBox(String count, String label, Color color) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(16)),
          child:
              Text(count, style: TextStyle(color: Colors.white, fontSize: 30)),
        ),
        SizedBox(height: 6),
        Text(label,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
