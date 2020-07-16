Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5065D222385
	for <lists+cocci@lfdr.de>; Thu, 16 Jul 2020 15:06:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06GD5mgt002594;
	Thu, 16 Jul 2020 15:05:48 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2E3D4782A;
	Thu, 16 Jul 2020 15:05:48 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E2E23785C
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:05:45 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06GD5jde029828
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:05:45 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 72EF72A570F
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jul 2020 18:35:11 +0530
Message-Id: <20200716130521.7717-8-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200716130521.7717-1-jaskaran.singh@collabora.com>
References: <20200716130521.7717-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:05:48 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:05:45 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH 07/17] parsing_cocci: re_constraints: Reflect
	attributefn in AST visitor
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

The SmPL AST visitor has a function for attributes. Reflect these
changes in re_constraints.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/re_constraints.ml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/re_constraints.ml b/parsing_cocci/re_constraints.ml
index 17011465..76ae85e6 100644
--- a/parsing_cocci/re_constraints.ml
+++ b/parsing_cocci/re_constraints.ml
@@ -44,7 +44,7 @@ let disj_free re =
     donothing donothing donothing donothing donothing donothing donothing ident
     expr donothing donothing donothing donothing ty donothing
     donothing donothing donothing decl donothing donothing ann_field donothing
-    rule_elem statement donothing donothing donothing in
+    rule_elem statement donothing donothing donothing donothing in
   try Hashtbl.find disj_free_table re
   with Not_found ->
     let res = v.V.combiner_rule_elem re in
@@ -90,7 +90,8 @@ let ok_for_all_rule_elems cstr minirules =
       donothing donothing donothing donothing donothing donothing donothing
       donothing donothing donothing donothing donothing donothing donothing
       donothing donothing donothing donothing donothing donothing donothing
-      donothing donothing rule_elem donothing donothing donothing donothing in
+      donothing donothing rule_elem donothing donothing donothing donothing
+      donothing in
   List.for_all v.V.combiner_top_level minirules
 
 let update_for_all_rule_elems cstr minirules =
@@ -113,7 +114,8 @@ let update_for_all_rule_elems cstr minirules =
       donothing donothing donothing donothing donothing donothing
       donothing donothing donothing donothing donothing
       donothing donothing donothing donothing donothing
-      donothing rule_elem donothing donothing donothing donothing in
+      donothing rule_elem donothing donothing donothing donothing
+      donothing in
   List.map v.V.rebuilder_top_level minirules
 
 let remove rule_name ((nm,_) as x) =
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
