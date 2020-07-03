Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EA3213F12
	for <lists+cocci@lfdr.de>; Fri,  3 Jul 2020 20:03:21 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 063I2tNn000413;
	Fri, 3 Jul 2020 20:02:55 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0910D7857;
	Fri,  3 Jul 2020 20:02:47 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 295E13F6C
 for <cocci@systeme.lip6.fr>; Fri,  3 Jul 2020 19:59:58 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 063HxviU008967
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 3 Jul 2020 19:59:57 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 8135E2A64FA
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Fri,  3 Jul 2020 23:29:15 +0530
Message-Id: <20200703175931.1693-5-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200703175931.1693-1-jaskaran.singh@collabora.com>
References: <20200703175931.1693-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 03 Jul 2020 20:02:55 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 03 Jul 2020 19:59:57 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
X-Mailman-Approved-At: Fri, 03 Jul 2020 20:02:40 +0200
Subject: [Cocci] [PATCH 04/20] parsing_cocci: adjust_pragmas: Wrap SmPL
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
adjust_pragmas.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/adjust_pragmas.ml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/adjust_pragmas.ml b/parsing_cocci/adjust_pragmas.ml
index b328ad27..8f24fa71 100644
--- a/parsing_cocci/adjust_pragmas.ml
+++ b/parsing_cocci/adjust_pragmas.ml
@@ -221,6 +221,11 @@ let rec left_ident i =
       call_right left_ident id i (function id -> Ast0.OptIdent(id))
   | Ast0.AsIdent(id,asid) -> failwith "not possible"
 
+let left_attribute attr =
+  match Ast0.unwrap attr with
+    Ast0.Attribute(a) ->
+      call_right left_mcode a attr (function a -> Ast0.Attribute(a))
+
 let left_fundecl name fninfo =
   let fncall_right processor data cont =
     match processor data with
@@ -238,7 +243,7 @@ let left_fundecl name fninfo =
   | (Ast0.FInline inl)::x ->
       fncall_right left_mcode inl (function inl -> (Ast0.FInline inl)::x)
   | (Ast0.FAttr atr)::x ->
-      fncall_right left_mcode atr (function atr -> (Ast0.FAttr atr)::x)
+      fncall_right left_attribute atr (function atr -> (Ast0.FAttr atr)::x)
 
 let rec left_decl decl =
   match Ast0.unwrap decl with
@@ -276,7 +281,7 @@ let rec left_decl decl =
 	    (function inl ->
 	      Ast0.FunProto((Ast0.FInline inl)::x,name,lp1,params,va,rp1,sem))
       | (Ast0.FAttr attr)::x ->
-	  call_right left_mcode attr decl
+	  call_right left_attribute attr decl
 	    (function attr ->
 	      Ast0.FunProto((Ast0.FAttr attr)::x,name,lp1,params,va,rp1,sem)))
   | Ast0.MacroDecl(Some stg,name,lp,args,rp,attr,sem) ->
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
