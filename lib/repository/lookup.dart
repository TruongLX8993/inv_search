

import 'package:get_it/get_it.dart';
import 'package:sds_invoice_search/repository/repositoryimpl/invrepo.dart';
import 'irepository/invrepo.dart';

class LookupRepo{
  final getIt = GetIt.instance;
  static LookupRepo _instance ;
  static get instance{
      _instance = _instance ?? LookupRepo();
      return _instance;
  }
  LookupRepo(){
    getIt.registerSingleton<InvRepository>(new InvRepositoryImpl());
  }
  T getRepo<T>(){
      return getIt<T>();
  } 


}