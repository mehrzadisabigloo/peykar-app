class Consts{
  static const String baseApiUrl = 'https://peykar.naslemontazer.ir/back/public/api/v1/';
  static const String baseFileUrl = '${baseApiUrl}upload/file/';
  static const String apiKey = String.fromEnvironment('API_KEY', defaultValue: '3702a7421bd806813b6f8bc937ba805d96ce9e429ed1f6fb6beac4408452c42a');
}