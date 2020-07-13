Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A683D218817
	for <lists+cocci@lfdr.de>; Wed,  8 Jul 2020 14:54:56 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 068CsSJT013815;
	Wed, 8 Jul 2020 14:54:30 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3C3677839;
	Wed,  8 Jul 2020 14:54:29 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 78F027849
 for <cocci@systeme.lip6.fr>; Wed,  8 Jul 2020 14:54:26 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 068CsPln005830
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 8 Jul 2020 14:54:25 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 99DF22A577B
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Wed,  8 Jul 2020 18:23:44 +0530
Message-Id: <20200708125357.8998-9-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200708125357.8998-1-jaskaran.singh@collabora.com>
References: <20200708125357.8998-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 14:54:30 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Wed, 08 Jul 2020 14:54:25 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] [PATCH 08/20] parsing_cocci: iso_pattern: Wrap SmPL
	Attributes
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
iso_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/iso_pattern.ml | 68 ++++++++++++++----------------------
 1 file changed, 27 insertions(+), 41 deletions(-)

diff --git a/parsing_cocci/iso_pattern.ml b/parsing_cocci/iso_pattern.ml
index 6cd5f1cb..40fd67e8 100644
--- a/parsing_cocci/iso_pattern.ml
+++ b/parsing_cocci/iso_pattern.ml
@@ -759,14 +759,10 @@ let match_maker checks_needed context_required whencode_allowed =
 		   match_ident fielda fieldb]
 	  | (Ast0.Cast(lp1,tya,attra,rp1,expa),
              Ast0.Cast(lp,tyb,attrb,rp,expb)) ->
-              if (List.length attra = List.length attrb &&
-                  List.fold_left2 (fun p a b -> p && mcode_equal a b) true
-                  attra attrb)
-              then
 	      conjunct_many_bindings
 		[check_mcode lp1 lp; check_mcode rp1 rp;
+                  match_attributes attra attrb;
 		  match_typeC tya tyb; match_expr expa expb]
-              else return false
 	  | (Ast0.SizeOfExpr(szf1,expa),Ast0.SizeOfExpr(szf,expb)) ->
 	      conjunct_bindings (check_mcode szf1 szf) (match_expr expa expb)
 	  | (Ast0.SizeOfType(szf1,lp1,tya,rp1),
@@ -940,27 +936,23 @@ let match_maker checks_needed context_required whencode_allowed =
 	  match (up,Ast0.unwrap d) with
 	    (Ast0.Init(stga,tya,ida,attra,eq1,inia,sc1),
 	     Ast0.Init(stgb,tyb,idb,attrb,eq,inib,sc)) ->
-	       if bool_match_option mcode_equal stga stgb &&
-                 (List.length attra = List.length attrb &&
-                  List.fold_left2 (fun p a b -> p && mcode_equal a b) true
-                    attra attrb) (* no metavars *)
+	       if bool_match_option mcode_equal stga stgb
 	       then
 		 conjunct_many_bindings
 		   [check_mcode eq1 eq; check_mcode sc1 sc;
 		     match_option check_mcode stga stgb;
 		     match_typeC tya tyb; match_ident ida idb;
+                     match_attributes attra attrb;
 		     match_init inia inib]
 	       else return false
 	  | (Ast0.UnInit(stga,tya,ida,attra,sc1),
 	     Ast0.UnInit(stgb,tyb,idb,attrb,sc)) ->
-	      if bool_match_option mcode_equal stga stgb &&
-                (List.length attra = List.length attrb &&
-                 List.fold_left2 (fun p a b -> p && mcode_equal a b) true
-                   attra attrb) (* no metavars *)
+	      if bool_match_option mcode_equal stga stgb
 	      then
 		conjunct_many_bindings
 		  [check_mcode sc1 sc; match_option check_mcode stga stgb;
-		    match_typeC tya tyb; match_ident ida idb]
+		    match_typeC tya tyb; match_ident ida idb;
+                    match_attributes attra attrb]
 	      else return false
 	  | (Ast0.FunProto(fninfo1,name1,lp1,params1,va1a,rp1,sem1),
 	     Ast0.FunProto(fninfo,name,lp,params,va1b,rp,sem)) ->
@@ -973,17 +965,15 @@ let match_maker checks_needed context_required whencode_allowed =
                  ]
 	  | (Ast0.MacroDecl(stga,namea,lp1,argsa,rp1,attra,sc1),
 	     Ast0.MacroDecl(stgb,nameb,lp,argsb,rp,attrb,sc)) ->
-	       if bool_match_option mcode_equal stga stgb &&
-                 (List.length attra = List.length attrb &&
-                  List.fold_left2 (fun p a b -> p && mcode_equal a b) true
-                    attra attrb) (* no metavars *)
+	       if bool_match_option mcode_equal stga stgb
 	       then
 		 conjunct_many_bindings
 		   [match_ident namea nameb;
 		     check_mcode lp1 lp; check_mcode rp1 rp;
 		     check_mcode sc1 sc;
 		     match_dots match_expr is_elist_matcher do_elist_match
-		       argsa argsb]
+                       argsa argsb;
+                     match_attributes attra attrb]
 	       else return false
 	  | (Ast0.MacroDeclInit(stga,namea,lp1,argsa,rp1,eq1,ini1,sc1),
 	     Ast0.MacroDeclInit(stgb,nameb,lp,argsb,rp,eq,ini,sc)) ->
@@ -999,12 +989,10 @@ let match_maker checks_needed context_required whencode_allowed =
 		     match_init ini1 ini]
 	       else return false
 	  | (Ast0.TyDecl(tya,attra,sc1),Ast0.TyDecl(tyb,attrb,sc)) ->
-	      if (List.length attra = List.length attrb &&
-                  List.fold_left2 (fun p a b -> p && mcode_equal a b) true
-                    attra attrb) (* no metavars *)
-              then
-	        conjunct_bindings (check_mcode sc1 sc) (match_typeC tya tyb)
-              else return false
+              conjunct_many_bindings
+                  [check_mcode sc1 sc;
+                    match_typeC tya tyb;
+                    match_attributes attra attrb]
 	  | (Ast0.Typedef(stga,tya,ida,sc1),Ast0.Typedef(stgb,tyb,idb,sc)) ->
 	      conjunct_bindings (check_mcode sc1 sc)
 		(conjunct_bindings (match_typeC tya tyb) (match_typeC ida idb))
@@ -1180,21 +1168,11 @@ let match_maker checks_needed context_required whencode_allowed =
 	then
 	  match (up,Ast0.unwrap p) with
 	    (Ast0.VoidParam(tya,attra),Ast0.VoidParam(tyb,attrb)) ->
-               if (List.length attra = List.length attrb &&
-                 List.fold_left2 (fun p a b -> p && mcode_equal a b) true
-                 attra attrb)
-               then
-                 match_typeC tya tyb
-               else return false
+               conjunct_bindings (match_typeC tya tyb)
+                   (match_attributes attra attrb)
 	  | (Ast0.Param(tya,ida,attra),Ast0.Param(tyb,idb,attrb)) ->
-               if (List.length attra = List.length attrb &&
-                 List.fold_left2 (fun p a b -> p && mcode_equal a b) true
-                 attra attrb)
-              then
-	        conjunct_bindings (match_typeC tya tyb)
+	      conjunct_bindings (match_typeC tya tyb)
 		  (match_option match_ident ida idb)
-              else
-                return false
 	  | (Ast0.PComma(c1),Ast0.PComma(c)) -> check_mcode c1 c
 	  | (Ast0.Pdots(d1),Ast0.Pdots(d)) -> check_mcode d1 d
 	  | (Ast0.OptParam(parama),Ast0.OptParam(paramb)) ->
@@ -1427,9 +1405,7 @@ let match_maker checks_needed context_required whencode_allowed =
 	  then conjunct_bindings (check_mcode ia ib) (loop (resta,restb))
 	  else return false
       |	(Ast0.FAttr(ia)::resta,Ast0.FAttr(ib)::restb) ->
-	  if mcode_equal ia ib
-	  then conjunct_bindings (check_mcode ia ib) (loop (resta,restb))
-	  else return false
+          conjunct_bindings (match_attributes [ia] [ib]) (loop (resta,restb))
       |	(x::resta,((y::_) as restb)) ->
 	  (match compare x y with
 	    -1 -> return false
@@ -1438,6 +1414,16 @@ let match_maker checks_needed context_required whencode_allowed =
       |	_ -> return false in
     loop (patterninfo,cinfo)
 
+  and match_attribute a1 a2 =
+    match (Ast0.unwrap a1,Ast0.unwrap a2) with
+      (Ast0.Attribute(attr1),Ast0.Attribute(attr2)) ->
+        check_mcode attr1 attr2
+
+  and match_attributes a1 a2 =
+    match_list match_attribute
+     (function _ -> false) (function _ -> failwith "")
+     a1 a2
+
   and match_case_line pattern c =
     if not(checks_needed) || not(context_required) || is_context c
     then
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
