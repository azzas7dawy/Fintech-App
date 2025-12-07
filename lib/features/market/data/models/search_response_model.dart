class SearchResponse {
  final List<SearchCoin> coins;

  SearchResponse({required this.coins});

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      coins: List<SearchCoin>.from(
        json['coins'].map((x) => SearchCoin.fromJson(x)),
      ),
    );
  }
}

class SearchCoin {
  final String id;
  final String name;
  final String? large;
  final String symbol;

  SearchCoin({
    required this.id,
    required this.name,
    required this.symbol,
    this.large,
  });

  factory SearchCoin.fromJson(Map<String, dynamic> json) => SearchCoin(
        id: json['id'],
        name: json['name'],
        symbol: json['symbol'],
        large: json['large'],
      );
}
