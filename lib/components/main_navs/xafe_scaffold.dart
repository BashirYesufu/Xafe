import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_textstyles.dart';
import '../../utilities/helpers/helper.dart';
import '../../utilities/providers/providers/loading_state_provider.dart';

class XafeScaffold extends StatelessWidget {
  final List<Widget> children;
  final Color appBarColor;
  final Color backgroundColor;
  final Widget? bottomNavBar;
  final String? appBarTitle;
  final List<Widget>? trailing;
  final Widget? leading;
  final bool hasBackButton;
  final bool hasLeading;
  final Widget? drawer;
  final bool hasAppBar;
  final EdgeInsetsGeometry? padding;
  final TextStyle? titleTextStyle;
  final Function? onBackPressed;
  final Widget? backButton;

  const XafeScaffold({
    this.appBarTitle,
    required this.children,
    this.appBarColor = AppColors.white,
    this.backgroundColor = AppColors.white,
    this.titleTextStyle,
    this.bottomNavBar,
    this.onBackPressed,
    this.hasBackButton = true,
    this.hasLeading = true,
    this.hasAppBar = true,
    this.trailing,
    this.leading,
    this.drawer,
    this.padding,
    this.backButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadingProvider = Provider.of<LoadingStateProvider>(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ModalProgressHUD(
        inAsyncCall: loadingProvider.loading,
        progressIndicator: Helper.showLoader(),
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            backgroundColor: backgroundColor,
            drawer: drawer,
            appBar: hasAppBar ? AppBar(
              backgroundColor: appBarColor,
              elevation: 0,
              centerTitle: true,
              title: Text(
                appBarTitle ?? '',
                style: titleTextStyle ?? AppTextStyles.deepBlue(size: 16),
              ),
              leading: leading ?? (hasBackButton
                  ? InkWell(
                 onTap: ()=>Navigator.pop(context),

                child: Icon(Icons.arrow_back_ios, color: AppColors.deepBlue,)
                ,)
                  : SizedBox()),
              actions: trailing,
            ) : null,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: padding ?? EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: Column(
                      children: children,
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: bottomNavBar ?? SizedBox(),
          ),
        ),
      ),
    );
  }
}
