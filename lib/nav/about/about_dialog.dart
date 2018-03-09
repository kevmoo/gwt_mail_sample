import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'about-dialog',
  styleUrls: const ['about_dialog.css'],
  templateUrl: 'about_dialog.html',
  directives: const [
    MaterialButtonComponent,
    MaterialDialogComponent,
    ModalComponent,
    coreDirectives
  ],
)
class AboutDialog {
  @Input()
  bool visible = false;

  void show() {
    visible = true;
  }
}
