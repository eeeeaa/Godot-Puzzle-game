GDPC                                                                                <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex�3      �      �p��<f��r�g��.�    res://GridGame/GridGame.gd.remap�C      ,       ��5#�z�R� �l�   res://GridGame/GridGame.gdc P      3
      Q	]���h��9@{   res://GridGame/GridGame.tscn�      F      ���~;�{��C�5�$   res://GridGame/GridPoint.gd.remap   �C      -       C~J��@��M_��9   res://GridGame/GridPoint.gdc�      8       3<=�K+I�؋'�2>)    res://GridGame/GridPoint.tscn          1      ^�,�GQ��_�   res://GridGame/Menu.gd.remap D      (       �A���fN���#g��	�   res://GridGame/Menu.gdc `      A       ��m�ǒ?�VmS��ٜ�   res://GridGame/Menu.tscn�      �       X_�c ����ö�f%$   res://GridGame/Player_board.gd.remapPD      0       �G@Y���"�t�    res://GridGame/Player_board.gdc P      _      ��8��쮫����#zl    res://GridGame/Player_board.tscn�      �       ���V�5��sA�Ν&   res://GridGame/Result.tscn  `       8        ��^��A���>\*   res://GridGame/Server.tscn  �       �      �i�	��Nk��Y��(   res://GridGame/TurnController.gd.remap  �D      2       �\���۹~Ǡ����	$   res://GridGame/TurnController.gdc   �"            l�n@�kB���r)�    res://GridGame/network.gd.remap �D      +       =�9����cHv�Ч���   res://GridGame/network.gdc   '      �      w�yD&l�<�=�h[��   res://default_env.tres  �2      �       um�`�N��<*ỳ�8   res://icon.png  �D      i      ����󈘥Ey��
�   res://icon.png.import   @A      �      �����%��(#AB�   res://project.binary`R      P      m:�ЍEp�{C	��    GDSC   "      =   �     ���ӄ�   �����Ķ�   �����������Ӷ���   �������Ӷ���   �������¶���   �����϶�   ������ݶ   ������¶   ����������������Ҷ��   �����������¶���   ������������������ζ   �����Ҷ�   ��������Ҷ��   ���Ӷ���   ���������ض�   ��ն   ����������¶   ����������������������ζ   �����������Ķ���   �Ҷ�   �����Ķ�   �������Ӷ���   �����������������Ķ�   ��������Ҷ��   ����������ض   �������Ӷ���   ����������������Ҷ��   ��������Ҷ��   ���������Ҷ�   ����϶��   ������������������Ķ   ����������¶   �������Ӷ���    ���������������������������Ҷ���       res://GridGame/Player_board.tscn      Players              post_game_finished        _on_post_finished      d                            turn_button_active        set_whose_turn        set_countdown      
         start_timer             server change turn        clear_board       turn_button_swap      display_to_output      
   Turn ended        switch attacking side         switch attacking side!              resetting_score                                      *      0      1   	   7   
   8      C      M      S      d      g      m      ~      �      �      �      �      �      �      �      �      �      �      �      �      �      �         !   	  "     #     $     %   -  &   4  '   7  (   >  )   D  *   G  +   K  ,   e  -   f  .   l  /   q  0   v  1   }  2   �  3   �  4   �  5   �  6   �  7   �  8   �  9   �  :   �  ;   �  <   �  =   3Y5;�  �E  PQY5;�  �  P�  QY;�  �  Y0�  PQV�  �  T�  P�  RR�  QY0�  PQV�  �  &�  �  V�  �  ;�	  �   PQ�  �  �  &P�	  �  �  QV�  �  T�
  �  �  �  P�  P�  T�  P�  QT�  QR�	  Q�  (V�  �  T�
  �  �  �  P�  P�  T�  P�  QT�  QR�	  Q�  �  T�  PQ�  �  P�
  R�  T�  L�  P�  T�  P�  T�  PQQT�  QMQ�  �  P�  R�  Q�  �  P�  Q�  �  �  Y0�  P�  QV�  ;�  �  T�  PQ�  �  T�  �  P�  Q�  �  T�  P�  Q�  �  T�  P�  QYD0�  PQV�  �  �8  P�  Q�  &�  P�  T�  P�  T�  PQQT�  Q�  PQT�  PQV�  &�  T�  �  V�  �  P�  Q�  �  P�  Q�  �  P�  R�  Q�  &�  T�  T�  PQV�  �  T�  LL�  R�  MM�  �  P�  R�  Q�  (V�  �  P�  R�  Q�  �  T�  PQ�  (V�  �  PQ�  �  P�
  R�  T�  L�  P�  T�  P�  T�  PQQT�  QMQ�  Y0�  PQV�  �8  P�  Q�  �  P�  Q�  �  P�  R�  Q�  &�  T�  T�  PQV�  �  P�  R�  Q�  (V�  �  P�  R�  Q�  �  T�  �  �  &�  T�  �  V�  �  T�   PQYY0�!  PQV�  �  P�  Q�  Y`             [gd_scene load_steps=4 format=2]

[ext_resource path="res://GridGame/GridGame.gd" type="Script" id=1]
[ext_resource path="res://GridGame/TurnController.gd" type="Script" id=2]
[ext_resource path="res://GridGame/GridPoint.tscn" type="PackedScene" id=3]

[node name="GridGame" type="Node2D"]
script = ExtResource( 1 )

[node name="Players" type="Node2D" parent="."]
script = ExtResource( 2 )

[node name="board" type="Node2D" parent="."]
editor/display_folded = true
visible = false

[node name="GridPoint" parent="board" instance=ExtResource( 3 )]

[node name="GridPoint2" parent="board" instance=ExtResource( 3 )]

[node name="GridPoint3" parent="board" instance=ExtResource( 3 )]

[node name="GridPoint4" parent="board" instance=ExtResource( 3 )]

[node name="GridPoint5" parent="board" instance=ExtResource( 3 )]

[node name="GridPoint6" parent="board" instance=ExtResource( 3 )]

[node name="GridPoint7" parent="board" instance=ExtResource( 3 )]

[node name="GridPoint8" parent="board" instance=ExtResource( 3 )]

[node name="GridPoint9" parent="board" instance=ExtResource( 3 )]

[node name="resetScoreButton" type="Button" parent="."]
margin_left = 323.783
margin_top = 344.455
margin_right = 458.783
margin_bottom = 383.455
text = "reset score"
[connection signal="pressed" from="resetScoreButton" to="." method="_on_resetScoreButton_pressed"]
          GDSC                   ���ׄ�             3Y`        [gd_scene load_steps=3 format=2]

[ext_resource path="res://GridGame/GridPoint.gd" type="Script" id=1]

[sub_resource type="RectangleShape2D" id=1]

[node name="GridPoint" type="Area2D"]
script = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )
               GDSC                   ���ӄ�                   3YY`               [gd_scene load_steps=2 format=2]

[ext_resource path="res://GridGame/Menu.gd" type="Script" id=1]

[node name="Menu" type="Node2D"]
script = ExtResource( 1 )
  GDSC         )   d     ���ӄ�   �����ض�   ����Ӷ��   ���Ӷ���   �������Ӷ���   �������¶���   �������Ӷ���   ��������¶��   ��ն   ������Ҷ   �����������Ӷ���   ������ݶ   �����������Ӷ���   ����������������Ҷ��   ��������������������Ҷ��   ����Ķ��   �Ҷ�   ���������Ҷ�   ����϶��   ������������Ҷ��   �����Ҷ�   ����Ķ��   ��������Ҷ��   ����������¶   ������׶   ������Զ   �����޶�   ���Ӷ���   ߶��                    GridGame      server call turn start              RPCturnStart      server call turn end   
   RPCturnEnd        update_score      stored board(Defend):         stored board(Attack):         got        from         score               true      false                                  &      +      /      4   	   ;   
   @      D      I      Q      `      h      s      ~      �      �      �      �      �      �      �      �      �      �      �      �                   !     "     #   9  $   =  %   S  &   X  '   [  (   `  )   3YE;�  YE;�  �  Y5;�  �  PQT�  PQT�  P�  QYH0�  PQV�  �8  P�  Q�  �  �  �  �  P�  QYH0�	  PQV�  �8  P�  Q�  �  �  �  P�  QYD0�
  P�  QV�  �  T�  L�  PQT�  PQM�  YD0�  P�  QV�  ;�  �  PQT�  PQ�  &�  T�  T�  PQV�  �  �  P�  T�  R�  Q�  �  P�  R�  R�  Q�  �8  P�	  �7  P�  T�  QQ�  �  T�  T�  PQ�  �  T�  �  �  (V�  �  T�  �  �  �8  P�
  �7  P�  T�  QQ�  �8  P�  �7  P�  Q�  �  T�  L�  MQ�  �8  P�  �7  P�  QQY0�  P�  V�  R�  V�  QV�  ;�  �  �  ;�  �.  P�  T�  PQR�  T�  PQQ�  &�  �  V�  .�  �  (V�  )�  �D  P�  QV�  &�  L�  ML�  M�  L�  ML�  M�  L�  ML�  M�  L�  ML�  MV�  �  �  �  &�  T�  PQ�  T�  PQ�  �  T�  PQV�  �8  P�  Q�  (V�  �8  P�  Q�  .�  ` [gd_scene load_steps=2 format=2]

[ext_resource path="res://GridGame/Player_board.gd" type="Script" id=1]

[node name="Player_board" type="Node2D"]
script = ExtResource( 1 )
  [gd_scene format=2]

[node name="Result" type="Node2D"]
        [gd_scene load_steps=2 format=2]

[sub_resource type="GDScript" id=1]
script/source = "extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = \"text\"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
"

[node name="Server" type="Node2D"]
script = SubResource( 1 )
               GDSC            �      ���Ӷ���   ������������������ζ   ����������¶   ����������������Ķ��   ��������Ҷ��   ����������������������ζ   ���������ض�   ��������¶��   ����������ض   ������Ҷ   �������Ӷ���   ��������������¶   �����������Ӷ���   ����Ӷ��   ����釶�   ������ݶ   ����������¶   ���Ӷ���   ����鄶�   �����釶   �����������Ӷ���   �����鄶   ��ն             round                     end_game                                                 "   	   (   
   1      7      A      J      N      R      ^      g      n      x      ~      �      �      �      �      �      �      3YY;�  Y;�  Y0�  PQV�  .�  P�  QY0�  PQV�  .�  Y0�  PQV�  �  P�  QT�  PQY0�  PQV�  �8  P�  �7  P�  QQ�  �  P�  QT�	  PQ�  �  �  �  �
  PQ�  �  P�  �  Q�  PQ�  �  P�  QT�  PQY0�  P�  QV�  �  P�  QT�  P�  QY0�
  PQV�  &�  �  V�  ;�  �  T�  L�  P�  PQT�  QM�  ;�  �  T�  L�  P�  P�  QT�  QM�  ;�  �  T�  L�  P�  PQT�  QM�  ;�  �  T�  L�  P�  P�  QT�  QM�  �  P�  R�  R�  R�  R�  Q�  �  T�
  PQ` GDSC   1      K   �     ���Ӷ���   �����������ⶶ��   �����������   ����������¶   �����������Ӷ���   ������������Ŷ��   ���������Ҷ�   ��������Ҷ��   �����������������Ҷ�   �����϶�   �������Ӷ���   ������¶   ������������Ķ��   ���¶���   �����������������������¶���   ����   ���������������Ķ���   ����������������Ҷ��   �Ҷ�   �������������������Ҷ���   ��������������Ķ   ��������������Ӷ   ��������Ҷ��   ����������������Ҷ��   �������Ӷ���   ���Ҷ���   �����Ҷ�   ��ն   ����������������Ķ��   ����Ӷ��   �����������϶���   ��Ŷ   �����Ҷ�   ���Ӷ���   �������������Ӷ�   ����Ҷ��   �������Ӷ���   �������¶���   ��������Ҷ��   �������Ӷ���   �����������Ķ���   ��������������Ӷ   �����Ķ�   �����������ض���   �����������������Ķ�   ����������ڶ   �������Ӷ���   �����������Ҷ���   �����������Ӷ���   �                     network_peer_connected        _player_connected         network_peer_disconnected         _player_disconnected   
    connected         disconnected         /root/GridGame        register_player       Client         registered as         was unregistered         res://GridGame/GridGame.tscn      pre_start_game        Players       spawn_player      post_game_finished        GridGame      end_game      res://GridGame/Result.tscn                           	      
                     	      
               $      +      1      4      :      G      T      U      Y      Z      `      i      r      {      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /     0     1     2     3     4     5   (  6   /  7   0  8   >  9   H  :   L  ;   R  <   ^  =   k  >   q  ?   {  @   �  A   �  B   �  C   �  D   �  E   �  F   �  G   �  H   �  I   �  J   �  K   3YYY:�  YYY:�  �  YYY;�  NOY;�  NOY;�  LMYE;�  LMYE;�  �  YB�  Y0�	  PQV�  �
  PQT�  P�  RR�  Q�  �
  PQT�  P�  RR�  Q�  �  �  PQYY0�  PQV�  ;�  �  T�  PQ�  �  T�  P�  R�  Q�  �
  PQT�  P�  QY0�  P�  QV�  �8  P�7  P�  Q�  QY0�  P�  QV�  �8  P�7  P�  Q�  QYD0�  P�  QV�  �  ;�  �
  PQT�  PQ�  �  �  &�  P�	  QV�  �  �  L�  M�  �  �  )�  �  V�  �  P�  R�
  R�  R�  L�  MQ�  �  �  P�
  R�  R�  L�  MQ�  �  �  �8  P�  R�  R�  R�  QYK0�  P�  QV�  �  T�  P�  Q�  �  �8  P�  R�  R�  QYD0�  PQV�  ;�  �
  PQT�  PQ�  �  &�  T�  P�  QV�  �  T�   P�  Q�  �  &�  T�!  PQ�  T�!  PQV�  &�  T�!  PQ�  V�  �"  PQY0�"  PQV�  ;�#  �E  P�  QT�$  PQ�  �
  PQT�%  PQT�&  P�#  Q�  )�  �  V�  �'  P�	  QT�(  P�  Q�  �  P�  QYD0�)  PQV�  ;�  �
  PQT�  PQ�  ;�#  �'  P�	  Q�  )�*  �#  T�'  P�  QT�+  PQV�  �#  T�  P�  R�  R�*  T�,  PQQ�  �-  P�  QY0�.  PQV�  ;�#  �
  PQT�%  PQT�'  P�  Q�  �  P�  Q�  �
  PQT�%  PQT�/  P�#  Q�  �
  PQT�0  P�  Q`    [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @           |  PNG �PNG

   IHDR   @   @   �iq�  ?IDATx��{pTU�����;�N7	�����%"fyN�8��r\]fEgةf���X�g��F�Y@Wp\]|,�D@��	$$���	��I�n���ҝt����JW�s��}�=���|�D(���W@T0^����f��	��q!��!i��7�C���V�P4}! ���t�ŀx��dB.��x^��x�ɏN��贚�E�2�Z�R�EP(�6�<0dYF���}^Ѡ�,	�3=�_<��(P&�
tF3j�Q���Q�B�7�3�D�@�G�U��ĠU=� �M2!*��[�ACT(�&�@0hUO�u��U�O�J��^FT(Qit �V!>%���9 J���jv	�R�@&��g���t�5S��A��R��OO^vz�u�L�2�����lM��>tH
�R6��������dk��=b�K�љ�]�י�F*W�볃�\m=�13� �Є,�ˏy��Ic��&G��k�t�M��/Q]�أ]Q^6o��r�h����Lʳpw���,�,���)��O{�:א=]� :LF�[�*���'/���^�d�Pqw�>>��k��G�g���No���\��r����/���q�̾��	�G��O���t%L�:`Ƶww�+���}��ݾ ۿ��SeŔ����  �b⾻ǰ��<n_�G��/��8�Σ�l]z/3��g����sB��tm�tjvw�:��5���l~�O���v��]ǚ��֩=�H	u���54�:�{"������}k����d���^��`�6�ev�#Q$�ήǞ��[�Ặ�e�e��Hqo{�59i˲����O+��e������4�u�r��z�q~8c
 �G���7vr��tZ5�X�7����_qQc�[����uR��?/���+d��x�>r2����P6����`�k��,7�8�ɿ��O<Ė��}AM�E%�;�SI�BF���}��@P�yK�@��_:����R{��C_���9������
M��~����i����������s���������6�,�c�������q�����`����9���W�pXW]���:�n�aұt~9�[���~e�;��f���G���v0ԣ� ݈���y�,��:j%gox�T
�����kְ�����%<��A`���Jk?���� gm���x�*o4����o��.�����逊i�L����>���-���c�����5L����i�}�����4����usB������67��}����Z�ȶ�)+����)+H#ۢ�RK�AW�xww%��5�lfC�A���bP�lf��5����>���`0ċ/oA-�,�]ĝ�$�峋P2/���`���;����[Y��.&�Y�QlM���ƌb+��,�s�[��S ��}<;���]�:��y��1>'�AMm����7q���RY%9)���ȡI�]>�_l�C����-z�� ;>�-g�dt5іT�Aͺy�2w9���d�T��J�}u�}���X�Ks���<@��t��ebL������w�aw�N����c����F���3
�2먭�e���PQ�s�`��m<1u8�3�#����XMڈe�3�yb�p�m��܇+��x�%O?CmM-Yf��(�K�h�بU1%?I�X�r��� ��n^y�U�����1�玒�6..e��RJrRz�Oc������ʫ��]9���ZV�\�$IL�OŨ��{��M�p�L56��Wy��J�R{���FDA@
��^�y�������l6���{�=��ή�V�hM�V���JK��:��\�+��@�l/���ʧ����pQ��������׷Q^^�(�T������|.���9�?I�M���>���5�f欙X�VƎ-f͚ո���9����=�m���Y���c��Z�̚5��k~���gHHR�Ls/l9²���+ ����:��杧��"9�@��ad�ŝ��ѽ�Y���]O�W_�`Ֆ#Դ8�z��5-N^�r�Z����h���ʆY���=�`�M���Ty�l���.	�/z��fH���������֗�H�9�f������G� ̛<��q��|�]>ں}�N�3�;i�r"�(2RtY���4X���F�
�����8 �[�\锰�b`�0s�:���v���2�f��k�Zp��Ω&G���=��6em.mN�o.u�fԐc��i����C���u=~{�����a^�UH������¡,�t(jy�Q�ɋ����5�Gaw��/�Kv?�|K��(��SF�h�����V��xȩ2St쯹���{6b�M/�t��@0�{�Ԫ�"�v7�Q�A�(�ľR�<	�w�H1D�|8�]�]�Ո%����jҢ꯸hs�"~꯸P�B�� �%I}}��+f�����O�cg�3rd���P�������qIڻ]�h�c9��xh )z5��� �ƾ"1:3���j���'1;��#U�失g���0I}�u3.)@�Q�A�ĠQ`I�`�(1h��t*�:�>'��&v��!I?�/.)@�S�%q�\���l�TWq�������լ�G�5zy6w��[��5�r���L`�^���/x}�>��t4���cݦ�(�H�g��C�EA�g�)�Hfݦ��5�;q-���?ư�4�����K����XQ*�av�F��������񵏷�;>��l�\F��Þs�c�hL�5�G�c�������=q�P����E �.���'��8Us�{Ǎ���#������q�HDA`b��%����F�hog���|�������]K�n��UJ�}������Dk��g��8q���&G����A�RP�e�$'�i��I3j�w8������?�G�&<	&䪬R��lb1�J����B$�9�꤮�ES���[�������8�]��I�B!
�T
L:5�����d���K30"-	�(��D5�v��#U�����jԔ�QR�GIaó�I3�nJVk���&'��q����ux��AP<�"�Q�����H�`Jң�jP(D��]�����`0��+�p�inm�r�)��,^�_�rI�,��H>?M-44���x���"� �H�T��zIty����^B�.��%9?E����П�($@H!�D��#m�e���vB(��t �2.��8!���s2Tʡ �N;>w'����dq�"�2����O�9$�P	<(��z�Ff�<�z�N��/yD�t�/?�B.��A��>��i%�ǋ"�p n� ���]~!�W�J���a�q!n��V X*�c �TJT*%�6�<d[�    IEND�B`�        [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
[remap]

path="res://GridGame/GridGame.gdc"
    [remap]

path="res://GridGame/GridPoint.gdc"
   [remap]

path="res://GridGame/Menu.gdc"
        [remap]

path="res://GridGame/Player_board.gdc"
[remap]

path="res://GridGame/TurnController.gdc"
              [remap]

path="res://GridGame/network.gdc"
     �PNG

   IHDR   @   @   �iq�  0IDATx��}pTU����L����W�$�@HA�%"fa��Yw�)��A��Egةf���X�g˱��tQ���Eq�!�|K�@BHH:�t>�;�����1!ݝn�A�_UWw����{λ��sϽO�q汤��X,�q�z�<�q{cG.;��]�_�`9s��|o���:��1�E�V� ~=�	��ݮ����g[N�u�5$M��NI��-
�"(U*��@��"oqdYF�y�x�N�e�2���s����KҦ`L��Z)=,�Z}"
�A�n{�A@%$��R���F@�$m������[��H���"�VoD��v����Kw�d��v	�D�$>	�J��;�<�()P�� �F��
�< �R����&�կ��� ����������%�u̚VLNfڠus2�̚VL�~�>���mOMJ���J'R��������X����׬X�Ϲ虾��6Pq������j���S?�1@gL���±����(�2A�l��h��õm��Nb�l_�U���+����_����p�)9&&e)�0 �2{��������1���@LG�A��+���d�W|x�2-����Fk7�2x��y,_�_��}z��rzy��%n�-]l����L��;
�s���:��1�sL0�ڳ���X����m_]���BJ��im�  �d��I��Pq���N'�����lYz7�����}1�sL��v�UIX���<��Ó3���}���nvk)[����+bj�[���k�������cݮ��4t:= $h�4w:qz|A��٧�XSt�zn{�&��õmQ���+�^�j�*��S��e���o�V,	��q=Y�)hԪ��F5~����h�4 *�T�o��R���z�o)��W�]�Sm銺#�Qm�]�c�����v��JO��?D��B v|z�կ��܈�'�z6?[� ���p�X<-���o%�32����Ρz�>��5�BYX2���ʦ�b��>ǣ������SI,�6���|���iXYQ���U�҅e�9ma��:d`�iO����{��|��~����!+��Ϧ�u�n��7���t>�l捊Z�7�nвta�Z���Ae:��F���g�.~����_y^���K�5��.2�Zt*�{ܔ���G��6�Y����|%�M	���NPV.]��P���3�8g���COTy�� ����AP({�>�"/��g�0��<^��K���V����ϫ�zG�3K��k���t����)�������6���a�5��62Mq����oeJ�R�4�q�%|�� ������z���ä�>���0�T,��ǩ�����"lݰ���<��fT����IrX>� � ��K��q�}4���ʋo�dJ��م�X�sؘ]hfJ�����Ŧ�A�Gm߽�g����YG��X0u$�Y�u*jZl|p������*�Jd~qcR�����λ�.�
�r�4���zپ;��AD�eЪU��R�:��I���@�.��&3}l
o�坃7��ZX��O�� 2v����3��O���j�t	�W�0�n5����#è����%?}����`9۶n���7"!�uf��A�l܈�>��[�2��r��b�O�������gg�E��PyX�Q2-7���ʕ������p��+���~f��;����T	�*�(+q@���f��ϫ����ѓ���a��U�\.��&��}�=dd'�p�l�e@y��
r�����zDA@����9�:��8�Y,�����=�l�֮��F|kM�R��GJK��*�V_k+��P�,N.�9��K~~~�HYY��O��k���Q�����|rss�����1��ILN��~�YDV��-s�lfB֬Y�#.�=�>���G\k֬fB�f3��?��k~���f�IR�lS'�m>²9y���+ �v��y��M;NlF���A���w���w�b���Л�j�d��#T��b���e��[l<��(Z�D�NMC���k|Zi�������Ɗl��@�1��v��Щ�!曣�n��S������<@̠7�w�4X�D<A`�ԑ�ML����jw���c��8��ES��X��������ƤS�~�׾�%n�@��( Zm\�raҩ���x��_���n�n���2&d(�6�,8^o�TcG���3���emv7m6g.w��W�e
�h���|��Wy��~���̽�!c� �ݟO�)|�6#?�%�,O֫9y������w��{r�2e��7Dl �ׇB�2�@���ĬD4J)�&�$
�HԲ��
/�߹�m��<JF'!�>���S��PJ"V5!�A�(��F>SD�ۻ�$�B/>lΞ�.Ϭ�?p�l6h�D��+v�l�+v$Q�B0ūz����aԩh�|9�p����cƄ,��=Z�����������Dc��,P��� $ƩЩ�]��o+�F$p�|uM���8R��L�0�@e'���M�]^��jt*:��)^�N�@�V`�*�js�up��X�n���tt{�t:�����\�]>�n/W�\|q.x��0���D-���T��7G5jzi���[��4�r���Ij������p�=a�G�5���ͺ��S���/��#�B�EA�s�)HO`���U�/QM���cdz
�,�!�(���g�m+<R��?�-`�4^}�#>�<��mp��Op{�,[<��iz^�s�cü-�;���쾱d����xk瞨eH)��x@���h�ɪZNU_��cxx�hƤ�cwzi�p]��Q��cbɽcx��t�����M|�����x�=S�N���
Ͽ�Ee3HL�����gg,���NecG�S_ѠQJf(�Jd�4R�j��6�|�6��s<Q��N0&Ge
��Ʌ��,ᮢ$I�痹�j���Nc���'�N�n�=>|~�G��2�)�D�R U���&ՠ!#1���S�D��Ǘ'��ೃT��E�7��F��(?�����s��F��pC�Z�:�m�p�l-'�j9QU��:��a3@0�*%�#�)&�q�i�H��1�'��vv���q8]t�4����j��t-}IـxY�����C}c��-�"?Z�o�8�4Ⱦ���J]/�v�g���Cȷ2]�.�Ǣ ��Ս�{0
�>/^W7�_�����mV铲�
i���FR��$>��}^��dُ�۵�����%��*C�'�x�d9��v�ߏ � ���ۣ�Wg=N�n�~������/�}�_��M��[���uR�N���(E�	� ������z��~���.m9w����c����
�?���{�    IEND�B`�       ECFG      _global_script_classes             _global_script_class_icons             application/config/name         ProjectServer      application/run/main_scene$         res://GridGame/Server.tscn     application/config/icon         res://icon.png     autoload/network$         *res://GridGame/network.gd     display/window/size/width            display/window/size/height            display/window/stretch/mode         viewport   display/window/stretch/aspect         keep)   rendering/environment/default_environment          res://default_env.tres  GDPC