import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widget/mydialog.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  void _alertDialog() async {
    var result = await showDialog(
        barrierDismissible: false, //表示点击灰色背景的时候是否消失弹出框
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示信息！"),
            content: const Text("您确定要删除吗"),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop("ok");
              }, child: const Text("确定")),
              TextButton(onPressed: () {
                Navigator.of(context).pop("cancel");
              }, child: const Text("取消")),
            ],
          );
        });
    print("_alertDialog $result");
  }

  void _simpleDialog() async {
    var result = await showDialog(context: context,
        builder: (context) {
          return SimpleDialog(title: const Text("请选择语言"),
            children: [
              SimpleDialogOption(onPressed: () {
                Navigator.pop(context, "汉语");
              },
                child: const Text("中文简体"),),
              SimpleDialogOption(onPressed: () {
                Navigator.pop(context, "英语");
              },
                child: const Text("英语"),),
              SimpleDialogOption(onPressed: () {
                Navigator.pop(context, "日语");
              },
                child: const Text("日语"),),
              SimpleDialogOption(onPressed: () {
                Navigator.pop(context, "韩语");
              },
                child: const Text("韩语"),),
              SimpleDialogOption(onPressed: () {
                Navigator.pop(context, "阿拉伯文");
              },
                child: const Text("阿拉伯文"),),
            ],);
        });
    print("_simpleDialog $result");
  }

  void _modelBottomSheet() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 240,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(title: const Text("分享"),
                  onTap: () {
                    Navigator.pop(context, "分享");
                  },),
                const Divider(),
                ListTile(title: const Text("收藏"),
                  onTap: () {
                    Navigator.pop(context, "收藏");
                  },),
                const Divider(),
                ListTile(title: const Text("取消"),
                  onTap: () {
                    Navigator.pop(context, "取消");
                  },)
              ],
            ),
          );
        });
    print("_modelBottomSheet $result");
  }

  void _toast() {
    Fluttertoast.showToast(msg: "提示信息",
        toastLength: Toast.LENGTH_LONG,
        //只针对android平台
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        //提示时间针对 ios 和 web
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16
    );
  }

  void _showMyDialog() async {
    var result = await showDialog(context: context,
        builder: (context) {
          return MyDialg(title: "tip", content: "时间到", onTap: () {
            Navigator.pop(context, "我是自定义窗口");
          });
        }
    );
    print("_showMyDialog $result");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: _alertDialog,
                child: const Text("alert弹出框-AlertDialog")),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: _simpleDialog,
                child: const Text("select弹出框-SimpleDialog")),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: _modelBottomSheet,
                child: const Text("ActionSheet底部弹出框")),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: _toast,
                child: const Text("Toast")),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: _showMyDialog,
                child: const Text("自定义弹窗")),
          ],
        ),
      ),
    );
  }
}
