Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE07218857
	for <lists+cocci@lfdr.de>; Wed,  8 Jul 2020 15:02:16 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 068D1WkF028867;
	Wed, 8 Jul 2020 15:01:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 335EC781D;
	Wed,  8 Jul 2020 15:01:32 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A148B44A7
 for <cocci@systeme.lip6.fr>; Wed,  8 Jul 2020 15:01:28 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 068D1Lpk001363
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 8 Jul 2020 15:01:21 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 57C6E2A07C0
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Wed,  8 Jul 2020 18:30:25 +0530
Message-Id: <20200708130035.26687-11-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200708130035.26687-1-jaskaran.singh@collabora.com>
References: <20200708130035.26687-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 15:01:32 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Wed, 08 Jul 2020 15:01:21 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] [PATCH v2 RESEND 10/20] parsing_cocci: unparse_ast0: Wrap
	SmPL Attributes
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

Attributes are wrapped in the SmPL AST. Reflect these changes in
unparse_ast0.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/unparse_ast0.ml | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/parsing_cocci/unparse_ast0.ml b/parsing_cocci/unparse_ast0.ml
index 81bbb71a..109f1844 100644
--- a/parsing_cocci/unparse_ast0.ml
+++ b/parsing_cocci/unparse_ast0.ml
@@ -223,8 +223,7 @@ let rec expression e =
 	  expression exp; mcode print_string ar; ident field
       | Ast0.Cast(lp,ty,attr,rp,exp) ->
 	  mcode print_string_box lp; typeC ty; close_box();
-	  (if not (attr = []) then print_string " ");
-	  print_between (fun _ -> print_string " ") (mcode print_string) attr;
+          print_attribute_list attr;
 	  mcode print_string rp; expression exp
       | Ast0.SizeOfExpr(szf,exp) ->
 	  mcode print_string szf; expression exp
@@ -408,15 +407,13 @@ and declaration d =
       |	Ast0.Init(stg,ty,id,attr,eq,ini,sem) ->
 	  print_option (mcode U.storage) stg;
 	  print_named_type ty id;
-	  (if not (attr = []) then print_string " ");
-	  print_between (fun _ -> print_string " ") (mcode print_string) attr;
+          print_attribute_list attr;
 	  print_string " ";
 	  mcode print_string eq; print_string " "; initialiser ini;
 	  mcode print_string sem
       | Ast0.UnInit(stg,ty,id,attr,sem) ->
 	  print_option (mcode U.storage) stg; print_named_type ty id;
-	  (if not (attr = []) then print_string " ");
-	  print_between (fun _ -> print_string " ") (mcode print_string) attr;
+          print_attribute_list attr;
 	  mcode print_string sem
       | Ast0.FunProto(fninfo,name,lp1,params,va,rp1,sem) ->
 	  List.iter print_fninfo fninfo;
@@ -429,8 +426,7 @@ and declaration d =
 	  ident name; mcode print_string_box lp;
 	  let _ = dots (function _ -> ()) expression args in
 	  close_box(); mcode print_string rp;
-	  (if not (attr = []) then print_string " ");
-	  print_between (fun _ -> print_string " ") (mcode print_string) attr;
+          print_attribute_list attr;
 	  mcode print_string sem
       | Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
 	  print_option (mcode U.storage) stg;
@@ -442,8 +438,7 @@ and declaration d =
 	  mcode print_string sem
       | Ast0.TyDecl(ty,attr,sem) ->
           typeC ty;
-          (if not (attr = []) then print_string " ");
-          print_between (fun _ -> print_string " ") (mcode print_string) attr;
+          print_attribute_list attr;
           mcode print_string sem
       | Ast0.Typedef(stg,ty,id,sem) ->
 	  mcode print_string stg; typeC ty; typeC id;
@@ -557,16 +552,13 @@ and parameterTypeDef p =
       match Ast0.unwrap p with
         Ast0.VoidParam(ty,attr) ->
           typeC ty;
-          (if (attr = []) then print_string " ");
-          print_between (fun _ -> print_string " ") (mcode print_string) attr;
+          print_attribute_list attr;
       | Ast0.Param(ty,Some id,attr) ->
           print_named_type ty id;
-          (if (attr = []) then print_string " ");
-          print_between (fun _ -> print_string " ") (mcode print_string) attr;
+          print_attribute_list attr;
       | Ast0.Param(ty,None,attr) ->
           typeC ty;
-          (if (attr = []) then print_string " ");
-          print_between (fun _ -> print_string " ") (mcode print_string) attr;
+          print_attribute_list attr;
       | Ast0.MetaParam(name,_,_) -> mcode print_meta name
       | Ast0.MetaParamList(name,_,_,_) -> mcode print_meta name
       | Ast0.PComma(cm) -> mcode print_string cm; print_space()
@@ -767,7 +759,15 @@ and print_fninfo = function
     Ast0.FStorage(stg) -> mcode U.storage stg
   | Ast0.FType(ty) -> typeC ty
   | Ast0.FInline(inline) -> mcode print_string inline
-  | Ast0.FAttr(attr) -> mcode print_string attr
+  | Ast0.FAttr(attr) -> print_attribute attr
+
+and print_attribute_list attrs =
+  if not (attrs = []) then print_string " ";
+  print_between (fun _ -> print_string " ") print_attribute attrs
+
+and print_attribute a =
+  match Ast0.unwrap a with
+    Ast0.Attribute(attr) -> mcode print_string attr
 
 and whencode notfn alwaysfn = function
     Ast0.WhenNot (_,_,a) ->
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
