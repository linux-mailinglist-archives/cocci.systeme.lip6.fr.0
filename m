Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4584A222354
	for <lists+cocci@lfdr.de>; Thu, 16 Jul 2020 15:03:07 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06GD1qbi022991;
	Thu, 16 Jul 2020 15:01:52 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1D0287857;
	Thu, 16 Jul 2020 15:01:48 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8B0B8782A
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:01:45 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06GD1iqc005697
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:01:45 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 04C9F2A570D
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jul 2020 18:29:55 +0530
Message-Id: <20200716130016.23729-5-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200716130016.23729-1-jaskaran.singh@collabora.com>
References: <20200716130016.23729-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:01:52 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 16 Jul 2020 15:01:45 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] [PATCH 04/24] parsing_cocci: function_prototypes: Reflect
	attributefn in AST0 visitor
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

The SmPL AST0 visitor has a function for attributes. Reflect these
changes in function_prototypes.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/function_prototypes.ml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/function_prototypes.ml b/parsing_cocci/function_prototypes.ml
index 966369b8..94dd2751 100644
--- a/parsing_cocci/function_prototypes.ml
+++ b/parsing_cocci/function_prototypes.ml
@@ -68,7 +68,7 @@ let drop_positions =
     donothing donothing donothing donothing donothing donothing donothing
     donothing donothing donothing donothing donothing donothing donothing
     donothing donothing donothing donothing donothing donothing donothing
-    donothing donothing donothing in
+    donothing donothing donothing donothing in
   res.VT0.rebuilder_rec_statement
 
 let get_all_functions rule =
@@ -174,7 +174,7 @@ and strip =
     donothing donothing
     ident donothing donothing donothing typeC donothing param
     donothing donothing donothing donothing donothing donothing donothing
-    donothing
+    donothing donothing
 
 and changed_proto = function
     (mname,mdef,mproto,None) -> true
@@ -198,7 +198,7 @@ let collect_ident_strings id =
       donothing donothing donothing donothing donothing donothing donothing
       donothing donothing donothing donothing donothing donothing donothing
       donothing donothing donothing donothing donothing donothing donothing
-      donothing donothing donothing in
+      donothing donothing donothing donothing in
       v.VT0.combiner_rec_ident id
 
 let right_attach_mcode strings (x,ar,info,mc,pos,adj) =
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
