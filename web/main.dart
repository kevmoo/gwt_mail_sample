import 'package:angular/angular.dart';
import 'package:angular/experimental.dart';

// ignore: uri_has_not_been_generated
import 'package:gwt_mail_sample/app/app_component.template.dart' as ng;
import 'package:gwt_mail_sample/mail/mail_service.dart';
import 'package:gwt_mail_sample/mail/mock_mail_service.dart';

main() {
  bootstrapFactory(ng.AppComponentNgFactory, ([parent]) {
    return new Injector.map({MailService: new MockMailService()}, parent);
  });
}
