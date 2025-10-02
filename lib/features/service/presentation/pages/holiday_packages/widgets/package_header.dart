import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/holiday_packages/models/destination_models.dart';

class PackageHeader extends StatelessWidget {
  final String startingFrom;
  final String travellingTo;
  final String? startDate;
  final int adults;
  final int rooms;

  final List<String> cities;
  final List<Destination> destinations;

  final ValueChanged<String> onStartingFromChanged;
  final ValueChanged<String> onTravellingToChanged;
  final ValueChanged<String> onDateChanged;
  final void Function(int adults, int rooms) onGuestsChanged;

  const PackageHeader({
    Key? key,
    required this.startingFrom,
    required this.travellingTo,
    required this.startDate,
    required this.adults,
    required this.rooms,
    required this.cities,
    required this.destinations,
    required this.onStartingFromChanged,
    required this.onTravellingToChanged,
    required this.onDateChanged,
    required this.onGuestsChanged,
  }) : super(key: key);

  Future<void> _showCityPicker(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        String query = '';
        List<String> filtered = List.from(cities);
        return StatefulBuilder(
          builder: (context, setInnerState) {
            filtered = cities
                .where((c) => c.toLowerCase().contains(query.toLowerCase()))
                .toList();
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: SizedBox(
                height: 420,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search city',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (v) => setInnerState(() => query = v),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (_, i) {
                          final city = filtered[i];
                          return ListTile(
                            leading: const Icon(Icons.location_city),
                            title: Text(city),
                            onTap: () {
                              Navigator.pop(context);
                              onStartingFromChanged(city);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _showDestinationPicker(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        String query = '';
        List<Destination> filtered = List.from(destinations);
        return StatefulBuilder(
          builder: (context, setInnerState) {
            filtered = destinations
                .where(
                  (d) => d.name.toLowerCase().contains(query.toLowerCase()),
                )
                .toList();
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: SizedBox(
                height: 420,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search destination',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (v) => setInnerState(() => query = v),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (_, i) {
                          final d = filtered[i];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(d.image),
                            ),
                            title: Text(d.name),
                            onTap: () {
                              Navigator.pop(context);
                              onTravellingToChanged(d.name);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _showGuestSelector(BuildContext context) async {
    int tmpAdults = adults;
    int tmpRooms = rooms;

    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Rooms & Guests'),
          content: StatefulBuilder(
            builder: (context, setInnerState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Adults'),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (tmpAdults > 1)
                                setInnerState(() => tmpAdults--);
                            },
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                          Text('$tmpAdults'),
                          IconButton(
                            onPressed: () => setInnerState(() => tmpAdults++),
                            icon: const Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Rooms'),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (tmpRooms > 1) setInnerState(() => tmpRooms--);
                            },
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                          Text('$tmpRooms'),
                          IconButton(
                            onPressed: () => setInnerState(() => tmpRooms++),
                            icon: const Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                onGuestsChanged(tmpAdults, tmpRooms);
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: const Icon(Icons.flight_takeoff),
            title: const Text('STARTING FROM'),
            subtitle: Text(startingFrom),
            onTap: () => _showCityPicker(context),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: const Icon(Icons.place),
            title: const Text('TRAVELLING TO'),
            subtitle: Text(travellingTo),
            trailing: const Icon(Icons.keyboard_arrow_down),
            onTap: () => _showDestinationPicker(context),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('STARTING DATE'),
                  subtitle: Text(startDate ?? 'Add Travel Date'),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(
                        const Duration(days: 365 * 2),
                      ),
                    );
                    if (picked != null)
                      onDateChanged(picked.toIso8601String().split('T')[0]);
                  },
                ),
              ),
            ),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text('ROOM & GUESTS'),
                  subtitle: Text(
                    '$adults Adults, $rooms Room${rooms > 1 ? 's' : ''}',
                  ),
                  onTap: () => _showGuestSelector(context),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
