import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/config/home_request.dart';
import 'package:flutter_tast/components/model/model.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';

class JobOffersBloc extends ProviderModel {

  List<OffersperItem>? jobOffersList;
  Future<List<OffersperItem>?> getOffers() async {
    loadingg(true);
    jobOffersList = await HomeRequest.getOffersper();
    loadingg(false);
    return jobOffersList;
  }
}
