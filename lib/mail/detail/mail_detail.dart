import 'dart:async';
import 'dart:html';
import 'dart:math' show max;

import 'package:angular/angular.dart';
import 'package:angular_components/utils/browser/dom_service/dom_service.dart';
import 'package:gwt_mail_sample/mail/mail_service.dart';

@Component(
  selector: 'mail-detail',
  styleUrls: const ['mail_detail.css'],
  templateUrl: 'mail_detail.html',
)
class MailDetail implements AfterContentInit, OnDestroy {
  final DomService domService;
  final MailService mailService;
  StreamSubscription _layoutSubscription;

  String get subject => mailService.selectedItem?.subject;
  String get sender => mailService.selectedItem?.sender;
  String get recipient => 'foo@example.com';
  String get body => mailService.selectedItem?.body;

  @ViewChild('bottom')
  Element bottomRef;

  int heightPx = 200;

  MailDetail(this.domService, this.mailService);

  @override
  ngAfterContentInit() {
    _layoutSubscription = domService.trackLayoutChange(_calculateGap, (gap) {
      heightPx = max(10, heightPx + gap);
    }, runInAngularZone: true);
  }

  @override
  ngOnDestroy() {
    _layoutSubscription?.cancel();
    _layoutSubscription = null;
  }

  int _calculateGap() {
    int bottom = bottomRef.offsetTop + bottomRef.offsetHeight;
    return window.innerHeight - bottom;
  }
}
