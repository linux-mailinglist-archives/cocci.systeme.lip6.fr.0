Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BB4BE2EF
	for <lists+cocci@lfdr.de>; Wed, 25 Sep 2019 18:56:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8PGtYWr004719;
	Wed, 25 Sep 2019 18:55:34 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E0C9377B4;
	Wed, 25 Sep 2019 18:55:33 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0FE6E76D9
 for <cocci@systeme.lip6.fr>; Wed, 25 Sep 2019 18:55:32 +0200 (CEST)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.141])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8PGscrA027211
 for <cocci@systeme.lip6.fr>; Wed, 25 Sep 2019 18:54:39 +0200 (CEST)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 4F2A8160062
 for <cocci@systeme.lip6.fr>; Wed, 25 Sep 2019 18:54:38 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 46dkgJ5vHnz6tm6;
 Wed, 25 Sep 2019 18:54:36 +0200 (CEST)
From: Michele Martone <michelemartone@users.sourceforge.net>
To: cocci@systeme.lip6.fr
Date: Wed, 25 Sep 2019 18:54:14 +0200
Message-Id: <20190925165414.23602-1-michelemartone@users.sourceforge.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 25 Sep 2019 18:55:36 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 25 Sep 2019 18:54:39 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: nicolas.palix@imag.fr
Subject: [Cocci] [PATCH] clarify misleading warning message
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

One may think that when warning that
 "should %s be a metavariable?"
Coccinelle also treats a given symbol %s as a metavariable.
Better state explicitly that this is not the case.
---
 parsing_cocci/check_meta.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/check_meta.ml b/parsing_cocci/check_meta.ml
index e728d8f5..b857d3f6 100644
--- a/parsing_cocci/check_meta.ml
+++ b/parsing_cocci/check_meta.ml
@@ -84,7 +84,7 @@ let rec ident context old_metas table minus i =
 	    not err(* warn only once per id *) && not info.Ast0.isSymbolIdent
 	  then
 	    warning
-	      (Printf.sprintf "line %d: should %s be a metavariable?" rl name)
+	      (Printf.sprintf "line %d: should %s be a metavariable? treating it as symbol." rl name)
       | _ -> ())
   | Ast0.MetaId(name,_,seedval,_) ->
       check_table table minus name;
-- 
2.20.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
