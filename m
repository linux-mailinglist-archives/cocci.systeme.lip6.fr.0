Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC3A561F0
	for <lists+cocci@lfdr.de>; Wed, 26 Jun 2019 08:00:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5Q5xlvn027023;
	Wed, 26 Jun 2019 07:59:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 7A9377784;
	Wed, 26 Jun 2019 07:59:47 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B89357770
 for <cocci@systeme.lip6.fr>; Wed, 26 Jun 2019 07:51:01 +0200 (CEST)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5Q5p19v025105
 for <cocci@systeme.lip6.fr>; Wed, 26 Jun 2019 07:51:01 +0200 (CEST)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id C62962400FC
 for <cocci@systeme.lip6.fr>; Wed, 26 Jun 2019 07:51:00 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 45YXFc1S2cz9rxM;
 Wed, 26 Jun 2019 07:51:00 +0200 (CEST)
Date: Wed, 26 Jun 2019 07:50:59 +0200
From: Michele Martone <michelemartone@users.sf.net>
To: cocci@systeme.lip6.fr
Message-ID: <20190626055059.GA9241@localhost>
Mail-Followup-To: cocci@systeme.lip6.fr
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 26 Jun 2019 07:59:49 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 26 Jun 2019 07:51:01 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Wed, 26 Jun 2019 07:59:45 +0200
Subject: [Cocci] [PATCH] --c++ --test will assume .cpp extension, not .c
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

--c++ --test will assume .cpp extension, not .c

Signed-off-by: Michele Martone <michelemartone@users.sf.net>
---
diff --git a/testing.ml b/testing.ml
index 258e6c6f..784040fe 100644
--- a/testing.ml
+++ b/testing.ml
@@ -97,7 +97,7 @@ let testone prefix x compare_with_expected =
   let x    = if x =~ "\\(.*\\)_ver0$" then matched1 x else x in
   let base = if x =~ "\\(.*\\)_ver[0-9]+$" then matched1 x else x in

-  let cfile      = prefix ^ x ^ ".c" in
+  let cfile      = if !Flag.c_plus_plus then prefix ^ x ^ ".cpp" else prefix ^ x ^ ".c" in
   let cocci_file = prefix ^ base ^ ".cocci" in

   let expected_out = prefix ^ base ^ out_suffix in

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
