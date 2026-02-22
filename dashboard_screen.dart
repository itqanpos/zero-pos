Card(
  child: InkWell(
    onTap: () => Navigator.pushNamed(context, "/products"),
    child: const Center(child: Text("Products")),
  ),
),
