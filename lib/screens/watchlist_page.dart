import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_page.dart';

class WatchlistScreen extends StatelessWidget {

  List<String> watchlists = ["Watchlist 1", "Watchlist 2", "Watchlist 3", "Mid-Cap"];

  void deleteWatchlist(String name) {
    watchlists.remove(name);
    // Implement state management to update UI
  }
  @override
  Widget build(BuildContext context) {
    void _showEditWatchlistBottomSheet(BuildContext context, List<String> watchlists, Function(String) onDelete) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        backgroundColor: Colors.black,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Edit Watchlist",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                Divider(color: Colors.white24),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: watchlists.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        title: Text(
                          watchlists[index],
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            onDelete(watchlists[index]); // Callback to delete the watchlist
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    }
    Widget _watchlistItem(String name) {
      return ListTile(
        title: Text(name, style: TextStyle(color: Colors.white)),
        trailing: Icon(Icons.edit, color: Colors.blue),
        onTap: () {
          _showEditWatchlistBottomSheet(context, watchlists, deleteWatchlist);

          // Handle watchlist selection/editing
        },
      );
    }

    void _showWatchlistBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        backgroundColor: Colors.black,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Watchlists",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                Divider(color: Colors.grey),
                ListView(
                  shrinkWrap: true,
                  children: [
                    _watchlistItem("Watchlist 1"),
                    _watchlistItem("Watchlist 2"),
                    _watchlistItem("Watchlist 3"),
                    _watchlistItem("Mid-Cap"),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    _showCreateWatchlistBottomSheet(context);
                  },
                  icon: Icon(Icons.add),
                  label: Text("Create a new watchlist"),
                ),
              ],
            ),
          );
        },
      );
    }





    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Watchlist",
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Watchlist Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _watchlistButton("Watchlist 1", isSelected: true),
                SizedBox(width: 8.w),
                _watchlistButton("Watchlist 2"),
                SizedBox(width: 8.w),
                _watchlistButton("Watchlist 3"),
              ],
            ),
            SizedBox(height: 50.h),

            /// Empty Watchlist Message
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.show_chart,
                    color: Colors.white54,
                    size: 60.w,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Looks like your watchlist is empty.",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  /// Add Mutual Funds Button
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.white),
                    label: Text(
                      "Add Mutual Funds",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      /// Floating Action Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showWatchlistBottomSheet(context),
        label: Text("Watchlist"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: 2, // Watchlist tab is selected
        onTap: (index) {

            if (index == 0) {
              // Navigate to Home Screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } else if (index == 2) {
              // Navigate to Watchlist Screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WatchlistScreen()),
              );
            }


        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Charts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Watchlist",
          ),
        ],
      )
    );
  }

  /// Helper Widget for Watchlist Tabs
  Widget _watchlistButton(String text, {bool isSelected = false}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.black,
        side: BorderSide(color: isSelected ? Colors.blue : Colors.white54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}



void _showCreateWatchlistBottomSheet(BuildContext context) {
  TextEditingController watchlistController = TextEditingController();

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    backgroundColor: Colors.black,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Create new watchlist",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: watchlistController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade900,
                hintText: "Enter watchlist name",
                hintStyle: TextStyle(color: Colors.white38),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                String watchlistName = watchlistController.text.trim();
                if (watchlistName.isNotEmpty) {
                  // Add logic to create a new watchlist
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Watchlist '$watchlistName' created")),
                  );
                  Navigator.pop(context);
                }
              },
              child: Text("Create"),
            ),
          ],
        ),
      );
    },
  );
}




// Watchlist Item Widget

