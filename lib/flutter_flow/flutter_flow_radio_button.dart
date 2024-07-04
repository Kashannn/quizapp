/*
 * Copyright 2020 https://github.com/TercyoStorck
 *
 * Source code has been modified by FlutterFlow, Inc.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
 * USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import 'flutter_flow_theme.dart';
import 'form_field_controller.dart';
import 'package:flutter/material.dart';

class FlutterFlowRadioButton extends StatefulWidget {
  const FlutterFlowRadioButton({
    super.key,
    required this.options,
    required this.onChanged,
    required this.controller,
    required this.optionHeight,
    required this.textStyle,
    this.optionWidth,
    this.selectedTextStyle,
    this.textPadding = EdgeInsets.zero,
    this.buttonPosition = RadioButtonPosition.left,
    this.direction = Axis.vertical,
    required this.radioButtonColor,
    this.inactiveRadioButtonColor,
    this.toggleable = false,
    this.horizontalAlignment = WrapAlignment.start,
    this.verticalAlignment = WrapCrossAlignment.start,
  });

  final List<String> options;
  final Function(String?)? onChanged;
  final FormFieldController<String> controller;
  final double optionHeight;
  final double? optionWidth;
  final TextStyle textStyle;
  final TextStyle? selectedTextStyle;
  final EdgeInsetsGeometry textPadding;
  final RadioButtonPosition buttonPosition;
  final Axis direction;
  final Color radioButtonColor;
  final Color? inactiveRadioButtonColor;
  final bool toggleable;
  final WrapAlignment horizontalAlignment;
  final WrapCrossAlignment verticalAlignment;

  @override
  State<FlutterFlowRadioButton> createState() => _FlutterFlowRadioButtonState();
}

class _FlutterFlowRadioButtonState extends State<FlutterFlowRadioButton> {
  bool get enabled => widget.onChanged != null;
  FormFieldController<String> get controller => widget.controller;
  void Function()? _listener;

  @override
  void initState() {
    super.initState();
    _maybeSetOnChangedListener();
  }

  @override
  void dispose() {
    _maybeRemoveOnChangedListener();
    super.dispose();
  }

  @override
  void didUpdateWidget(FlutterFlowRadioButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldWidgetEnabled = oldWidget.onChanged != null;
    if (oldWidgetEnabled != enabled) {
      _maybeRemoveOnChangedListener();
      _maybeSetOnChangedListener();
    }
  }

  void _maybeSetOnChangedListener() {
    if (enabled) {
      _listener = () => widget.onChanged!(controller.value);
      controller.addListener(_listener!);
    }
  }

  void _maybeRemoveOnChangedListener() {
    if (_listener != null) {
      controller.removeListener(_listener!);
      _listener = null;
    }
  }

  List<String> get effectiveOptions =>
      widget.options.isEmpty ? ['[Option]'] : widget.options;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(unselectedWidgetColor: widget.inactiveRadioButtonColor),
      child: RadioGroup<String>.builder(
        direction: widget.direction,
        groupValue: controller.value,
        onChanged: enabled ? (value) => controller.value = value : null,
        activeColor: widget.radioButtonColor,
        toggleable: widget.toggleable,
        textStyle: widget.textStyle,
        selectedTextStyle: widget.selectedTextStyle ?? widget.textStyle,
        textPadding: widget.textPadding,
        optionHeight: widget.optionHeight,
        optionWidth: widget.optionWidth,
        horizontalAlignment: widget.horizontalAlignment,
        verticalAlignment: widget.verticalAlignment,
        items: effectiveOptions,
        itemBuilder: (item) =>
            RadioButtonBuilder(item, buttonPosition: widget.buttonPosition),
      ),
    );
  }
}

enum RadioButtonPosition {
  right,
  left,
}

class RadioButtonBuilder<T> {
  RadioButtonBuilder(
      this.description, {
        this.buttonPosition = RadioButtonPosition.left,
      });

  final String description;
  final RadioButtonPosition buttonPosition;
}

class RadioButton<T> extends StatefulWidget {
 RadioButton({
    super.key,
    required this.description,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.buttonPosition,
    required this.activeColor,
    required this.toggleable,
    required this.textStyle,
    required this.selectedTextStyle,
    required this.textPadding,
    this.shouldFlex = false,
  });

  String description;
  final T value;
  final T? groupValue;
  final void Function(T?)? onChanged;
  final RadioButtonPosition buttonPosition;
  final Color activeColor;
  final bool toggleable;
  final TextStyle textStyle;
  final TextStyle selectedTextStyle;
  final EdgeInsetsGeometry textPadding;
  final bool shouldFlex;

  @override
  State<RadioButton<T>> createState() => _RadioButtonState<T>();
}

class _RadioButtonState<T> extends State<RadioButton<T>> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.description);
    _controller.addListener(() {
      setState(() {
        widget.description = _controller.text;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedStyle = widget.selectedTextStyle;
    final isSelected = widget.value == widget.groupValue;

    // Changed Text widget to TextField
    Widget radioButtonText = Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
        child: Container(
          width: 340.0,
          height: 55.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
          ),
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: SizedBox(
              width: double.infinity,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    widget.description = value;
                  });
                },
                controller: _controller,
                style: isSelected ? selectedStyle : widget.textStyle,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
                  hintText: 'Option  ',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (widget.shouldFlex) {
      radioButtonText = Flexible(child: radioButtonText);
    }

    return InkWell(
      onTap: () => {}, // Override onTap to do nothing
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget.buttonPosition == RadioButtonPosition.left)
            radioButtonText,
          Radio<T>(
            groupValue: widget.groupValue,
            onChanged: widget.onChanged,
            value: widget.value,
            activeColor: widget.activeColor,
            toggleable: widget.toggleable,
          ),
          if (widget.buttonPosition == RadioButtonPosition.right)
            radioButtonText,
        ],
      ),
    );
  }
}



class RadioGroup<T> extends StatelessWidget {
  const RadioGroup.builder({
    super.key,
    required this.groupValue,
    required this.onChanged,
    required this.items,
    required this.itemBuilder,
    required this.direction,
    required this.optionHeight,
    required this.horizontalAlignment,
    required this.activeColor,
    required this.toggleable,
    required this.textStyle,
    required this.selectedTextStyle,
    required this.textPadding,
    this.optionWidth,
    this.verticalAlignment = WrapCrossAlignment.center,
  });

  final T? groupValue;
  final List<T> items;
  final RadioButtonBuilder Function(T value) itemBuilder;
  final void Function(T?)? onChanged;
  final Axis direction;
  final double optionHeight;
  final double? optionWidth;
  final WrapAlignment horizontalAlignment;
  final WrapCrossAlignment verticalAlignment;
  final Color activeColor;
  final bool toggleable;
  final TextStyle textStyle;
  final TextStyle selectedTextStyle;
  final EdgeInsetsGeometry textPadding;

  List<Widget> get _group => items.map(
        (item) {
      final radioButtonBuilder = itemBuilder(item);
      return SizedBox(
        height: optionHeight,
        width: optionWidth,
        child: RadioButton(
          description: radioButtonBuilder.description,
          value: item,
          groupValue: groupValue,
          onChanged: onChanged,
          buttonPosition: radioButtonBuilder.buttonPosition,
          activeColor: activeColor,
          toggleable: toggleable,
          textStyle: textStyle,
          selectedTextStyle: selectedTextStyle,
          textPadding: textPadding,
          shouldFlex: optionWidth != null,
        ),
      );
    },
  ).toList();

  @override
  Widget build(BuildContext context) => direction == Axis.horizontal
      ? Wrap(
    direction: direction,
    alignment: horizontalAlignment,
    children: _group,
  )
      : Wrap(
    direction: direction,
    crossAxisAlignment: verticalAlignment,
    children: _group,
  );
}
