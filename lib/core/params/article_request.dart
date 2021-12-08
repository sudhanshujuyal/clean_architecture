class ArticlesRequestParams
{
  final String? apiKey;
  final String? country;
  final String? category;
  final int? page;
  final int? pageSize;
  const ArticlesRequestParams({
     this.apiKey,this.country, this.category,this.page,this.pageSize
});
}