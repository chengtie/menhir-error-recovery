Caml1999M029����            ,pureLexer.ml����  0  �  #�  #?�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���*ppx_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����o�@�@@@@�@@@�@�������*ocaml.text���@@ ���@@ �A�������	�

   This module demonstrates that a lexer generated by ocamllex can be
   turned into a functional lexer, simply by memoizing all the
   encountered tokens and by seeing a lexer as a projection of these
   tokens.

��,pureLexer.mlA@@�H � �@@��A@@�H � �@@@@��A@@�H � �@@��
A@@�H � �@��A@@�H � �@��������&Parser��J � ��J � �@��J � ��J � �@@A��J � �� J � �@@��"J � ��#J � �@���������&Parser1MenhirInterpreter��0K � ��1K �@��3K � ��4K �@@A��6K � ��7K �@@��9K � ��:K �@���A�    �&ptoken��CM
�DM
@@@@A��������%token��OM
�PM
@@��RM
�SM
@@@������&Lexing(position��]M
 �^M
/@@��`M
 �aM
/@@@������&Lexing(position��kM
2�lM
A@@��nM
2�oM
A@@@@��qM
�rM
A@@@@��tM

�uM
A@@��wM

�xM
A@������%Lexer���OCJ��OCO@�������@�����&buffer���ZZ`��ZZf@���ZZ`��ZZf@@@������#ref���[im��[ip@���[im��[ip@@@��@����"[]���[iq��[is@@���[iq��[is@@@@���[im��[is@@@@���ZZ\��[is@@���ZZ\��[is@���@�����$size���]u{��]u@���]u{��]u@@@������#ref���^����^��@���^����^��@@@��@���!0@���^����^��@@@@���^����^��@@@@���]uw��^��@@���]uw��^��@���@�����$more���`����`��@���`����`��@@@������#ref���`����`��@��`���`��@@@��@��@@����"()��`���`��@@��`���`��@@@�  ����%false��`���`��@@��`���`��@@@�� `���!`��@@@��#`���$`��@���'`���(`��@@@@��*`���+`��@@@@��-`���.`��@@��0`���1`��@���@�����*initialize��<b���=b��@��?b���@b��@@@��@@���&lexbuf��Hb���Ib��@��Kb���Lb��@@@������":=��Uc���Vc��@��Xc���Yc��@@@��@����$more��bc���cc��@��ec���fc��@@@��@������8lexer_lexbuf_to_supplier��qc���rc��@��tc���uc��@@@��@�����%Lexer%token���c����c�@���c����c�@@@��@����&lexbuf���c���c�	@���c���c�	@@@@���c����c�	@@@@���c����c�	@@@���b����c�	A@@@���b����c�	@@���b����c�	@���A�    �!t���e��e@@@@A�����#int���e��e@@���e��e@@@@���e��e@@���e��e@���@�����%start���g!��g&@���g!��g&@@@���!0@���g)��g*@@@@���g��g*@@���g��g*@���@�����#get���i,2��i,5@���i,2��i,5@@@��@@���#pos���i,6��i,9@���i,6��i,9@@@�������$List#nth���j<@��j<H@��j<@�j<H@@@��@������!!��j<I�j<J@��j<I�j<J@@@��@����&buffer��j<J�j<P@��j<J�j<P@@@@�� j<I�!j<P@@@��@������!-��,j<X�-j<Y@��/j<X�0j<Y@@@��@������.��:j<R�;j<S@��=j<R�>j<S@@@��@����$size��Gj<S�Hj<W@��Jj<S�Kj<W@@@@��Mj<R�Nj<W@@@��@����#pos��Wj<Z�Xj<]@��Zj<Z�[j<]@@@@��]j<Q�^j<^@���aj<R�bj<]@@@@��dj<@�ej<^@@@��gi,6�hj<^A@@@��ji,.�kj<^@@��mi,.�nj<^@���@�����/token_of_ptoken��yl`f�zl`u@��|l`f�}l`u@@@��@@������!p���l`w��l`x@���l`w��l`x@@@��@���l`z��l`{@@@��@���l`}��l`~@@@@���l`v��l`@����l`w��l`~@@@����!p���l`���l`�@���l`���l`�@@@���l`v��l`�A@@@���l`b��l`�@@���l`b��l`�@���@�����:current_position_of_ptoken���n����n��@���n����n��@@@��@@����@���n����n��@@@����%start���n����n��@���n����n��@@@����$stop���n����n��@���n����n��@@@@���n����n��@����n����n��@@@�������(Position(lex_join���o����o��@���o����o��@@@��@����%start���o����o��@��o���o��@@@��@����$stop��o���o��@��o���o��@@@@��o���o��@@@��n���o��A@@@��n���o��@@��n���o��@���@�����0current_position��&q���'q��@��)q���*q��@@@��@@���#pos��2q���3q��@��5q���6q��@@@������:current_position_of_ptoken��?r���@r�@��Br���Cr�@@@��@������#get��Nr��Or�@��Qr��Rr�@@@��@����#pos��[r��\r�@��^r��_r�@@@@��ar��br� @���er��fr�@@@@��hr���ir� @@@��kq���lr� A@@@��nq���or� @@��qq���rr� @���@�����$get'��}t"(�~t",@���t"(��t",@@@��@@���#pos���t"-��t"0@���t"-��t"0@@@������/token_of_ptoken���u37��u3F@���u37��u3F@@@��@������#get���u3H��u3K@���u3H��u3K@@@��@����#pos���u3L��u3O@���u3L��u3O@@@@���u3G��u3P@����u3H��u3O@@@@���u37��u3P@@@���t"-��u3PA@@@���t"$��u3P@@���t"$��u3P@���@�����$next���wRX��wR\@���wRX��wR\@@@��@@���#pos���wR]��wR`@���wR]��wR`@@@�  ��������">=���xcn��xcp@���xcn��xcp@@@��@����#pos���xcj��xcm@��xcj�xcm@@@��@��������xcw�xcx@��xcw�xcx@@@��@��������xcq�xcr@��xcq�xcr@@@��@����$size��'xcr�(xcv@��*xcr�+xcv@@@@��-xcq�.xcv@@@��@���!1@��6xcy�7xcz@@@@��9xcq�:xcz@@@@��<xcj�=xcz@@@�  ��������Gy���Hy��@��Jy���Ky��@@@��@����&buffer��Ty���Uy��@��Wy���Xy��@@@��@����"::��ay���by��@������������d��py���qy��@��sy���ty��@@@��@����$more��}y���~y��@���y����y��@@@@���y����y��@@@��@��������y����y��@@���y����y��@@@@���y����y��@@@�����������y����y��@���y����y��@@@��@����&buffer���y����y��@���y����y��@@@@���y����y��@@@@���y����y��A@@���y����y��@@@@���y����y��@@@������$incr���z����z��@���z����z��@@@��@����$size���z����z��@���z����z��@@@@���z����z��@@@���xc���{��@����y����z��@@@@���xcg��{��@@@��@�����#pos���|����|��@���|����|��@@@������!+���|����|��@���|����|��@@@��@����#pos��|���|��@��|���|��@@@��@���!1@��|���|��@@@@��|���|��@@@@��|���|��@@���������#get��#}���$}��@��&}���'}��@@@��@����#pos��0}���1}��@��3}���4}��@@@@��6}���7}��@@@�����#pos��?}���@}��@��B}���C}��@@@@��E}���F}��@���I}���J}��@@@��L|���M}��@@@��Oxcg�P}��@@@��RwR]�S}��A@@@��UwRT�V}��@@��XwRT�Y}��@���@�����1skip_until_before��d���e�@��g���h�@@@��@@���$pred��p��q�@��s��t�@@@��@@���#pos��|�	�}�@���	���@@@��A�����#aux��� @�� @@��� @�� @@@@��@@���#pos��� @�� @"@��� @�� @"@@@��@��������%token��� A%/�� A%4@��� A%/�� A%4@@@��@��� A%6�� A%7@@@��@��� A%9�� A%:@@@@��� A%/�� A%:@@@������#get��� A%=�� A%@@��� A%=�� A%@@@@��@����#pos��� A%A�� A%D@��� A%A�� A%D@@@@��� A%=�� A%D@@@@��� A%+�� A%D@@��������!=��� BHW�� BHX@��� BHW�� BHX@@@��@����%token��� BHQ�� BHV@��� BHQ�� BHV@@@��@����#EOF��� BHY�� BH\@@��  BHY� BH\@@@@�� BHQ� BH\@@@����#pos�� BHb� BHe@�� BHb� BHe@@@���������$pred�� Cft� Cfx@�� Cft� Cfx@@@��@����%token��( Cfy�) Cf~@��+ Cfy�, Cf~@@@@��. Cft�/ Cf~@@@��������7 Cf��8 Cf�@��: Cf��; Cf�@@@��@����#pos��D Cf��E Cf�@��G Cf��H Cf�@@@��@���!1@��P Cf��Q Cf�@@@@��S Cf��T Cf�@@@�������#aux��^ D���_ D��@��a D���b D��@@@��@������#snd��m D���n D��@��p D���q D��@@@��@������$next��| D���} D��@�� D���� D��@@@��@����#pos��� D���� D��@��� D���� D��@@@@��� D���� D��@���� D���� D��@@@@��� D���� D��@���� D���� D��@@@@��� D���� D��@@@��� Cfq�� D��@@@��� BHN�� D��@@@��� A%+�� D��@@@��� @�� D��A@@@��� @�� D��@@������#aux��� F���� F��@��� F���� F��@@@��@����#pos��� F���� F��@��� F���� F��@@@@��� F���� F��@@@��� @�� F��@@@����	�� F��A@@������ F��A@@@������� F��@@������� F��@@���XLR�� H��@@�����A�    �!t���PV]��PV^@@@@A�����#int���PVa��PVd@@���PVa��PVd@@@@���PVX��PVd@@���PVX��PVd@���Р*initialize��Qek�Qeu@��@�����&Lexing&lexbuf��Qex�Qe�@@��Qex�Qe�@@@����$unit��Qe��Qe�@@��Qe��Qe�@@@��Qex� Qe�@@@@@��"Qeg�#Qe�@��%Qeg�&Qe�@���Р%start��.R���/R��@����!t��6R���7R��@@��9R���:R��@@@@@��<R���=R��@��?R���@R��@���Р$next��HS���IS��@��@����!t��RS���SS��@@��US���VS��@@@�������&ptoken��`S���aS��@@��cS���dS��@@@�����!t��lS���mS��@@��oS���pS��@@@@��rS���sS��@@@��uS���vS��@@@@@��xS���yS��@��{S���|S��@���Р#get���T����T��@��@����!t���T����T��@@���T����T��@@@����&ptoken���T����T��@@���T����T��@@@���T����T��@@@@@���T����T��@���T����T��@���Р$get'���U����U��@��@����!t���U����U��@@���U����U��@@@����%token���U����U��@@���U����U��@@@���U����U��@@@@@���U����U��@���U����U��@���Р0current_position���V����V�@��@����!t���V���V�	@@���V���V�	@@@�����(Position!t���V���V�@@���V���V�@@@���V���V�@@@@@���V����V�@���V����V�@���Р1skip_until_before��W�W/@��@��@����%token��W3�W8@@��W3�W8@@@����$bool��W<�W@@@��W<�W@@@@��!W3�"W@@@@��@����!t��+WE�,WF@@��.WE�/WF@@@����!t��6WJ�7WK@@��9WJ�:WK@@@��<WE�=WK@@@��?W2�@WK@@@@@��BW�CWK@��EW�FWK@@��HOCR�IXLO@@��KOCP�L H��@@@��NOCC�O H��@��QOCC�R H��@@