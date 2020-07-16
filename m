Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFC722237C
	for <lists+cocci@lfdr.de>; Thu, 16 Jul 2020 15:06:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06GD5lpx004624;
	Thu, 16 Jul 2020 15:05:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id F1A90782D;
	Thu, 16 Jul 2020 15:05:40 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9E1E5781E
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:05:38 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06GD5buu026737
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:05:37 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id B27002A570F
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jul 2020 18:35:05 +0530
Message-Id: <20200716130521.7717-2-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200716130521.7717-1-jaskaran.singh@collabora.com>
References: <20200716130521.7717-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:05:47 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:05:37 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH 01/17] parsing_cocci: visitor_ast: Add attributefn
	to SmPL AST visitor
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Add a public function to visit attributes in the SmPL AST visitor.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/visitor_ast.ml  | 12 ++++++++----
 parsing_cocci/visitor_ast.mli |  4 ++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/visitor_ast.ml b/parsing_cocci/visitor_ast.ml
index 5288c6f2..17afc518 100644
--- a/parsing_cocci/visitor_ast.ml
+++ b/parsing_cocci/visitor_ast.ml
@@ -34,6 +34,7 @@ type 'a combiner =
      combiner_rule_elem : Ast.rule_elem -> 'a;
      combiner_statement : Ast.statement -> 'a;
      combiner_case_line : Ast.case_line -> 'a;
+     combiner_attribute : Ast.attr -> 'a;
      combiner_top_level : Ast.top_level -> 'a;
      combiner_anything : Ast.anything  -> 'a;
      combiner_expression_dots : Ast.expression Ast.dots -> 'a;
@@ -57,7 +58,7 @@ let combiner bind option_default
     identfn exprfn fragfn fmtfn assignOpfn binaryOpfn ftfn tyfn initfn
     paramfn define_paramfn declfn
     annotated_declfn fieldfn annotated_fieldfn enum_declfn rulefn stmtfn
-    casefn topfn anyfn =
+    casefn attributefn topfn anyfn =
   let multibind l =
     let rec loop = function
 	[] -> option_default
@@ -921,7 +922,7 @@ let combiner bind option_default
     let k a =
       match Ast.unwrap a with
         Ast.Attribute(attr) -> string_mcode attr in
-    k a
+    attributefn all_functions k a
 
 
   and whencode notfn alwaysfn = function
@@ -1027,6 +1028,7 @@ let combiner bind option_default
       combiner_rule_elem = rule_elem;
       combiner_statement = statement;
       combiner_case_line = case_line;
+      combiner_attribute = attribute;
       combiner_top_level = top_level;
       combiner_anything = anything;
       combiner_expression_dots = expression_dots;
@@ -1059,6 +1061,7 @@ type rebuilder =
       rebuilder_parameter_list : Ast.parameter_list inout;
       rebuilder_statement : Ast.statement inout;
       rebuilder_case_line : Ast.case_line inout;
+      rebuilder_attribute : Ast.attr inout;
       rebuilder_rule_elem : Ast.rule_elem inout;
       rebuilder_top_level : Ast.top_level inout;
       rebuilder_expression_dots : Ast.expression Ast.dots inout;
@@ -1085,7 +1088,7 @@ let rebuilder
     enumdecldotsfn initdotsfn
     identfn exprfn fragfn fmtfn assignOpfn binaryOpfn ftfn tyfn initfn
     paramfn define_paramfn declfn annotated_declfn fieldfn annotated_fieldfn
-    enum_declfn rulefn stmtfn casefn topfn anyfn =
+    enum_declfn rulefn stmtfn casefn attributefn topfn anyfn =
   let get_option f = function
       Some x -> Some (f x)
     | None -> None in
@@ -1917,7 +1920,7 @@ let rebuilder
       Ast.rewrap a
         (match Ast.unwrap a with
           Ast.Attribute(attr) -> Ast.Attribute(string_mcode attr)) in
-    k a
+    attributefn all_functions k a
 
   and whencode notfn alwaysfn = function
       Ast.WhenNot a -> Ast.WhenNot (notfn a)
@@ -2026,6 +2029,7 @@ let rebuilder
       rebuilder_rule_elem = rule_elem;
       rebuilder_statement = statement;
       rebuilder_case_line = case_line;
+      rebuilder_attribute = attribute;
       rebuilder_top_level = top_level;
       rebuilder_expression_dots = expression_dots;
       rebuilder_statement_dots = statement_dots;
diff --git a/parsing_cocci/visitor_ast.mli b/parsing_cocci/visitor_ast.mli
index 0ed17774..55bfbf3f 100644
--- a/parsing_cocci/visitor_ast.mli
+++ b/parsing_cocci/visitor_ast.mli
@@ -23,6 +23,7 @@ type 'a combiner =
      combiner_rule_elem : Ast_cocci.rule_elem -> 'a;
      combiner_statement : Ast_cocci.statement -> 'a;
      combiner_case_line : Ast_cocci.case_line -> 'a;
+     combiner_attribute : Ast_cocci.attr -> 'a;
      combiner_top_level : Ast_cocci.top_level -> 'a;
      combiner_anything : Ast_cocci.anything  -> 'a;
      combiner_expression_dots : Ast_cocci.expression Ast_cocci.dots -> 'a;
@@ -77,6 +78,7 @@ val combiner :
       ((Ast_cocci.rule_elem,'a) ccode) ->
       ((Ast_cocci.statement,'a) ccode) ->
       ((Ast_cocci.case_line,'a) ccode) ->
+      ((Ast_cocci.attr,'a) ccode) ->
       ((Ast_cocci.top_level,'a) ccode) ->
       ((Ast_cocci.anything,'a) ccode) ->
       'a combiner
@@ -101,6 +103,7 @@ type rebuilder =
       rebuilder_parameter_list : Ast_cocci.parameter_list inout;
       rebuilder_statement : Ast_cocci.statement inout;
       rebuilder_case_line : Ast_cocci.case_line inout;
+      rebuilder_attribute : Ast_cocci.attr inout;
       rebuilder_rule_elem : Ast_cocci.rule_elem inout;
       rebuilder_top_level : Ast_cocci.top_level inout;
       rebuilder_expression_dots : Ast_cocci.expression Ast_cocci.dots inout;
@@ -158,6 +161,7 @@ val rebuilder :
     (Ast_cocci.rule_elem rcode) ->
     (Ast_cocci.statement rcode) ->
     (Ast_cocci.case_line rcode) ->
+    (Ast_cocci.attr rcode) ->
     (Ast_cocci.top_level rcode) ->
     (Ast_cocci.anything rcode) ->
     rebuilder
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
