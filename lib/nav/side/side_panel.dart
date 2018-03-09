import 'dart:async';
import 'dart:html';
import 'dart:math' show max;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/utils/browser/dom_service/dom_service.dart';
import 'package:gwt_mail_sample/contact/contact_list.dart';
import 'package:gwt_mail_sample/mail/folder/mail_folder.dart';
import 'package:gwt_mail_sample/task/task_list.dart';

@Component(
  selector: 'side-panel',
  styleUrls: const ['side_panel.css'],
  templateUrl: 'side_panel.html',
  directives: const [
    ContactList,
    MailFolder,
    MaterialExpansionPanel,
    MaterialIconComponent,
    TaskList,
  ],
)
class SidePanel implements AfterContentInit, OnDestroy {
  final DomService domService;
  StreamSubscription _layoutSubscription;

  String selectedPanel = 'mailboxes';

  @ViewChild('bottom')
  Element bottomRef;

  int heightPx = 200;

  SidePanel(this.domService);

  void open(String panel) {
    selectedPanel = panel;
  }

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
