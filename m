Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C7A218854
	for <lists+cocci@lfdr.de>; Wed,  8 Jul 2020 15:02:04 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 068D1U6d023264;
	Wed, 8 Jul 2020 15:01:30 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id DF11144A7;
	Wed,  8 Jul 2020 15:01:29 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C96467829
 for <cocci@systeme.lip6.fr>; Wed,  8 Jul 2020 15:01:26 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 068D1PZ1018498
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 8 Jul 2020 15:01:25 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 6858A2A573C
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Wed,  8 Jul 2020 18:30:28 +0530
Message-Id: <20200708130035.26687-14-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200708130035.26687-1-jaskaran.singh@collabora.com>
References: <20200708130035.26687-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 15:01:30 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 15:01:25 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH v2 RESEND 13/20] parsing_cocci: visitor_ast: Wrap
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

Attributes are wrapped in the SmPL AST. Create a function for attributes
in the SmPL AST visitor. This function has not been added to the
visitor API yet.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/visitor_ast.ml | 48 +++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/parsing_cocci/visitor_ast.ml b/parsing_cocci/visitor_ast.ml
index 8129bcda..d5819acf 100644
--- a/parsing_cocci/visitor_ast.ml
+++ b/parsing_cocci/visitor_ast.ml
@@ -201,7 +201,7 @@ let combiner bind option_default
       | Ast.Cast(lp,ty,attr,rp,exp) ->
 	  let llp = string_mcode lp in
 	  let lty = fullType ty in
-	  let lattr = multibind (List.map string_mcode attr) in
+	  let lattr = multibind (List.map attribute attr) in
 	  let lrp = string_mcode rp in
 	  let lexp = expression exp in
           multibind [llp; lty; lattr; lrp; lexp]
@@ -448,7 +448,7 @@ let combiner bind option_default
       |	Ast.Init(stg,ty,id,attr,eq,ini,sem) ->
 	  let lstg = get_option storage_mcode stg in
 	  let lid = named_type ty id in
-	  let lattr = multibind (List.map string_mcode attr) in
+	  let lattr = multibind (List.map attribute attr) in
 	  let leq = string_mcode eq in
 	  let lini = initialiser ini in
 	  let lsem = string_mcode sem in
@@ -456,7 +456,7 @@ let combiner bind option_default
       | Ast.UnInit(stg,ty,id,attr,sem) ->
 	  let lstg = get_option storage_mcode stg in
 	  let lid = named_type ty id in
-	  let lattr = multibind (List.map string_mcode attr) in
+	  let lattr = multibind (List.map attribute attr) in
 	  let lsem = string_mcode sem in
 	  multibind [lstg; lid; lattr; lsem]
       | Ast.FunProto(fi,name,lp1,params,va,rp1,sem) ->
@@ -477,7 +477,7 @@ let combiner bind option_default
 	  let llp = string_mcode lp in
 	  let largs = expression_dots args in
 	  let lrp = string_mcode rp in
-	  let lattr = multibind (List.map string_mcode attr) in
+	  let lattr = multibind (List.map attribute attr) in
 	  let lsem = string_mcode sem in
 	  multibind [lstg; lname; llp; largs; lrp; lattr; lsem]
       | Ast.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
@@ -492,7 +492,7 @@ let combiner bind option_default
 	  multibind [lstg; lname; llp; largs; lrp; leq; lini; lsem]
       | Ast.TyDecl(ty,attr,sem) ->
 	  let lty = fullType ty in
-	  let lattr = multibind (List.map string_mcode attr) in
+	  let lattr = multibind (List.map attribute attr) in
 	  let lsem = string_mcode sem in
 	  multibind [lty; lattr; lsem]
       | Ast.Typedef(stg,ty,id,sem) ->
@@ -626,15 +626,15 @@ let combiner bind option_default
       match Ast.unwrap p with
         Ast.VoidParam(ty,attr) ->
           let lty = fullType ty in
-          let lattr = multibind (List.map string_mcode attr) in
+          let lattr = multibind (List.map attribute attr) in
           bind lty lattr
       | Ast.Param(ty,Some id,attr) ->
           let lid = named_type ty id in
-          let lattr = multibind (List.map string_mcode attr) in
+          let lattr = multibind (List.map attribute attr) in
           bind lid lattr
       | Ast.Param(ty,None,attr) ->
           let lty = fullType ty in
-          let lattr = multibind (List.map string_mcode attr) in
+          let lattr = multibind (List.map attribute attr) in
           bind lty lattr
       | Ast.MetaParam(name,_,_,_) -> meta_mcode name
       | Ast.MetaParamList(name,_,_,_,_) -> meta_mcode name
@@ -915,7 +915,14 @@ let combiner bind option_default
       Ast.FStorage(stg) -> storage_mcode stg
     | Ast.FType(ty) -> fullType ty
     | Ast.FInline(inline) -> string_mcode inline
-    | Ast.FAttr(attr) -> string_mcode attr
+    | Ast.FAttr(attr) -> attribute attr
+
+  and attribute a =
+    let k a =
+      match Ast.unwrap a with
+        Ast.Attribute(attr) -> string_mcode attr in
+    k a
+
 
   and whencode notfn alwaysfn = function
       Ast.WhenNot a -> notfn a
@@ -1199,7 +1206,7 @@ let rebuilder
 	| Ast.Cast(lp,ty,attr,rp,exp) ->
 	    let llp = string_mcode lp in
 	    let lty = fullType ty in
-	    let lattr = List.map string_mcode attr in
+	    let lattr = List.map attribute attr in
 	    let lrp = string_mcode rp in
 	    let lexp = expression exp in
 	    Ast.Cast(llp, lty, lattr, lrp, lexp)
@@ -1406,7 +1413,7 @@ let rebuilder
 	    let lstg = get_option storage_mcode stg in
 	    let lty = fullType ty in
 	    let lid = ident id in
-	    let lattr = List.map string_mcode attr in
+	    let lattr = List.map attribute attr in
 	    let leq = string_mcode eq in
 	    let lini = initialiser ini in
 	    let lsem = string_mcode sem in
@@ -1415,7 +1422,7 @@ let rebuilder
 	    let lstg = get_option storage_mcode stg in
 	    let lty = fullType ty in
 	    let lid = ident id in
-	    let lattr = List.map string_mcode attr in
+	    let lattr = List.map attribute attr in
 	    let lsem = string_mcode sem in
 	    Ast.UnInit(lstg, lty, lid, lattr, lsem)
 	| Ast.FunProto(fi,name,lp,params,va,rp,sem) ->
@@ -1436,7 +1443,7 @@ let rebuilder
 	    let llp = string_mcode lp in
 	    let largs = expression_dots args in
 	    let lrp = string_mcode rp in
-	    let lattr = List.map string_mcode attr in
+	    let lattr = List.map attribute attr in
 	    let lsem = string_mcode sem in
 	    Ast.MacroDecl(lstg, lname, llp, largs, lrp, lattr, lsem)
 	| Ast.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
@@ -1451,7 +1458,7 @@ let rebuilder
 	    Ast.MacroDeclInit(lstg, lname, llp, largs, lrp, leq, lini, lsem)
 	| Ast.TyDecl(ty,attr,sem) ->
 	    let lty = fullType ty in
-	    let lattr = List.map string_mcode attr in
+	    let lattr = List.map attribute attr in
 	    let lsem = string_mcode sem in
 	    Ast.TyDecl(lty, lattr, lsem)
 	| Ast.Typedef(stg,ty,id,sem) ->
@@ -1598,10 +1605,10 @@ let rebuilder
       Ast.rewrap p
 	(match Ast.unwrap p with
 	  Ast.VoidParam(ty,attr) ->
-            Ast.VoidParam(fullType ty,List.map string_mcode attr)
+            Ast.VoidParam(fullType ty,List.map attribute attr)
 	| Ast.Param(ty,id,attr) ->
             Ast.Param
-              (fullType ty, get_option ident id,List.map string_mcode attr)
+              (fullType ty, get_option ident id,List.map attribute attr)
 	| Ast.MetaParam(name,constraints,keep,inherited) ->
 	    Ast.MetaParam(meta_mcode name,constraints,keep,inherited)
 	| Ast.MetaParamList(name,lenname_inh,constraints,keep,inherited) ->
@@ -1902,7 +1909,14 @@ let rebuilder
       Ast.FStorage(stg) -> Ast.FStorage(storage_mcode stg)
     | Ast.FType(ty) -> Ast.FType(fullType ty)
     | Ast.FInline(inline) -> Ast.FInline(string_mcode inline)
-    | Ast.FAttr(attr) -> Ast.FAttr(string_mcode attr)
+    | Ast.FAttr(attr) -> Ast.FAttr(attribute attr)
+
+  and attribute a =
+    let k a =
+      Ast.rewrap a
+        (match Ast.unwrap a with
+          Ast.Attribute(attr) -> Ast.Attribute(string_mcode attr)) in
+    k a
 
   and whencode notfn alwaysfn = function
       Ast.WhenNot a -> Ast.WhenNot (notfn a)
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
