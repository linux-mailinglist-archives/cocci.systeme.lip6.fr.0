Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C78EE218826
	for <lists+cocci@lfdr.de>; Wed,  8 Jul 2020 14:55:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 068CsT0P023767;
	Wed, 8 Jul 2020 14:54:29 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id CAB4B7829;
	Wed,  8 Jul 2020 14:54:28 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 75E487849
 for <cocci@systeme.lip6.fr>; Wed,  8 Jul 2020 14:54:25 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 068CsLsg025881
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 8 Jul 2020 14:54:21 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 94CBB2A5778
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Wed,  8 Jul 2020 18:23:41 +0530
Message-Id: <20200708125357.8998-6-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200708125357.8998-1-jaskaran.singh@collabora.com>
References: <20200708125357.8998-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 14:54:29 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 14:54:21 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH 05/20] parsing_cocci: arity: Wrap SmPL Attributes
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
arity.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/arity.ml | 67 +++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/parsing_cocci/arity.ml b/parsing_cocci/arity.ml
index 3bbecedf..524f8994 100644
--- a/parsing_cocci/arity.ml
+++ b/parsing_cocci/arity.ml
@@ -256,10 +256,10 @@ let rec top_expression opt_allowed tgt expr =
       make_exp expr tgt arity (Ast0.RecordPtAccess(exp,ar,field))
   | Ast0.Cast(lp,ty,attr,rp,exp) ->
       let arity =
-        exp_same (mcode2line lp) (List.map mcode2arity ([lp] @ attr @ [rp])) in
+        exp_same (mcode2line lp) (List.map mcode2arity ([lp;rp])) in
       let lp = mcode lp in
       let ty = typeC arity ty in
-      let attr = List.map mcode attr in
+      let attr = List.map attribute attr in
       let rp = mcode rp in
       let exp = expression arity exp in
       make_exp expr tgt arity (Ast0.Cast(lp,ty,attr,rp,exp))
@@ -564,7 +564,7 @@ and declaration tgt decl =
       let stg = get_option mcode stg in
       let ty = typeC arity ty in
       let id = ident false arity id in
-      let attr = List.map mcode attr in
+      let attr = List.map attribute attr in
       let eq = mcode eq in
       let exp = initialiser arity exp in
       let sem = mcode sem in
@@ -577,7 +577,7 @@ and declaration tgt decl =
       let stg = get_option mcode stg in
       let ty = typeC arity ty in
       let id = ident false arity id in
-      let attr = List.map mcode attr in
+      let attr = List.map attribute attr in
       let sem = mcode sem in
       make_decl decl tgt arity (Ast0.UnInit(stg,ty,id,attr,sem))
   | Ast0.FunProto(fi,name,lp1,params,va,rp1,sem) ->
@@ -601,13 +601,13 @@ and declaration tgt decl =
       let arity =
 	all_same true tgt (mcode2line lp)
 	  ((match stg with None -> [] | Some x -> [mcode2arity x]) @
-	   (List.map mcode2arity ([lp;rp] @ attr @ [sem]))) in
+	   (List.map mcode2arity ([lp;rp;sem]))) in
       let stg = get_option mcode stg in
       let name = ident false arity name in
       let lp = mcode lp in
       let args = dots (expression arity) args in
       let rp = mcode rp in
-      let attr = List.map mcode attr in
+      let attr = List.map attribute attr in
       let sem = mcode sem in
       make_decl decl tgt arity (Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem))
   | Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
@@ -627,9 +627,9 @@ and declaration tgt decl =
   | Ast0.TyDecl(ty,attr,sem) ->
       let arity =
         all_same true tgt
-          (mcode2line sem) (List.map mcode2arity (attr @ [sem])) in
+          (mcode2line sem) [mcode2arity sem] in
       let ty = typeC arity ty in
-      let attr = List.map mcode attr in
+      let attr = List.map attribute attr in
       let sem = mcode sem in
       make_decl decl tgt arity (Ast0.TyDecl(ty,attr,sem))
   | Ast0.Typedef(stg,ty,id,sem) ->
@@ -816,40 +816,30 @@ and make_param =
 
 and parameterTypeDef tgt param =
   let param_same = all_same true tgt in
-  let make_param_attr param tgt ret = function
-      [] -> Ast0.rewrap param ret
-    | x::_ as xs ->
-        let arity = param_same (mcode2line x) (List.map mcode2arity xs) in
-        make_param param tgt arity ret in
   match Ast0.unwrap param with
     Ast0.VoidParam(ty,attr) ->
-      let ty = top_typeC tgt true ty in
-      let attr = List.map mcode attr in
-      let ret = Ast0.VoidParam(ty,attr) in
-      make_param_attr param tgt ret attr
+      Ast0.rewrap param (Ast0.VoidParam(typeC tgt ty,List.map attribute attr))
   | Ast0.Param(ty,Some id,attr) ->
       let ty = top_typeC tgt true ty in
       let id = ident true tgt id in
-      let attr = List.map mcode attr in
-      let ret =
-	match (Ast0.unwrap ty,Ast0.unwrap id) with
-	  (Ast0.OptType(ty),Ast0.OptIdent(id)) ->
-	    Ast0.OptParam(Ast0.rewrap param (Ast0.Param(ty,Some id,attr)))
-	| (Ast0.OptType(ty),_) ->
-	    fail param "arity mismatch in param declaration"
-	| (_,Ast0.OptIdent(id)) ->
-	    fail param "arity mismatch in param declaration"
-	| _ -> Ast0.Param(ty,Some id,attr) in
-      make_param_attr param tgt ret attr
+      let attr = List.map attribute attr in
+      Ast0.rewrap param
+        (match (Ast0.unwrap ty,Ast0.unwrap id) with
+  	  (Ast0.OptType(ty),Ast0.OptIdent(id)) ->
+  	    Ast0.OptParam(Ast0.rewrap param (Ast0.Param(ty,Some id,attr)))
+        | (Ast0.OptType(ty),_) ->
+  	    fail param "arity mismatch in param declaration"
+        | (_,Ast0.OptIdent(id)) ->
+  	    fail param "arity mismatch in param declaration"
+        | _ -> Ast0.Param(ty,Some id,attr))
   | Ast0.Param(ty,None,attr) ->
       let ty = top_typeC tgt true ty in
-      let attr = List.map mcode attr in
-      let ret =
-	match Ast0.unwrap ty with
-	  Ast0.OptType(ty) ->
+      let attr = List.map attribute attr in
+      Ast0.rewrap param
+        (match Ast0.unwrap ty with
+          Ast0.OptType(ty) ->
 	    Ast0.OptParam(Ast0.rewrap param (Ast0.Param(ty,None,attr)))
-	| _ -> Ast0.Param(ty,None,attr) in
-      make_param_attr param tgt ret attr
+        | _ -> Ast0.Param(ty,None,attr))
   | Ast0.MetaParam(name,cstr,pure) ->
       let arity = param_same (mcode2line name) [mcode2arity name] in
       let name = mcode name in
@@ -1272,7 +1262,7 @@ and fninfo arity = function
     Ast0.FStorage(stg) -> Ast0.FStorage(mcode stg)
   | Ast0.FType(ty) -> Ast0.FType(typeC arity ty)
   | Ast0.FInline(inline) -> Ast0.FInline(mcode inline)
-  | Ast0.FAttr(attr) -> Ast0.FAttr(mcode attr)
+  | Ast0.FAttr(attr) -> Ast0.FAttr(attribute attr)
 
 and fninfo2arity fninfo =
   List.concat
@@ -1281,9 +1271,14 @@ and fninfo2arity fninfo =
 	   Ast0.FStorage(stg) -> [mcode2arity stg]
 	 | Ast0.FType(ty) -> []
 	 | Ast0.FInline(inline) -> [mcode2arity inline]
-	 | Ast0.FAttr(attr) -> [mcode2arity attr])
+	 | Ast0.FAttr(attr) -> [])
        fninfo)
 
+and attribute attr =
+  match Ast0.unwrap attr with
+    Ast0.Attribute(a) ->
+      Ast0.rewrap attr (Ast0.Attribute(mcode a))
+
 and whencode notfn alwaysfn expression = function
     Ast0.WhenNot (w,e,a) -> Ast0.WhenNot (w,e,notfn a)
   | Ast0.WhenAlways (w,e,a) -> Ast0.WhenAlways (w,e,alwaysfn a)
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
