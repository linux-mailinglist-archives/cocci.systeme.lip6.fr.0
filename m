Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ECD218847
	for <lists+cocci@lfdr.de>; Wed,  8 Jul 2020 15:01:33 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 068D1JFF026859;
	Wed, 8 Jul 2020 15:01:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1A2C6782B;
	Wed,  8 Jul 2020 15:01:11 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id EDEA07825
 for <cocci@systeme.lip6.fr>; Wed,  8 Jul 2020 15:01:09 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 068D19jk028260
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 8 Jul 2020 15:01:09 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id AA3472A0A8B
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Wed,  8 Jul 2020 18:30:16 +0530
Message-Id: <20200708130035.26687-2-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200708130035.26687-1-jaskaran.singh@collabora.com>
References: <20200708130035.26687-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 15:01:19 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 15:01:09 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH v2 RESEND 01/20] parsing_cocci: ast0_cocci: Wrap
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

SmPL attributes need to be wrapped to provide support for meta
attributes. Wrap attributes in AST0 of SmPL.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/ast0_cocci.ml  | 5 ++++-
 parsing_cocci/ast0_cocci.mli | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/ast0_cocci.ml b/parsing_cocci/ast0_cocci.ml
index 743fab86..bfc0d145 100644
--- a/parsing_cocci/ast0_cocci.ml
+++ b/parsing_cocci/ast0_cocci.ml
@@ -460,7 +460,10 @@ and fninfo =
   | FInline of string mcode
   | FAttr of attr
 
-and attr = string mcode
+and base_attr =
+    Attribute of string mcode
+
+and attr = base_attr wrap
 
 and ('a,'b) whencode =
     WhenNot of string mcode (* when *) * string mcode (* != *) * 'a
diff --git a/parsing_cocci/ast0_cocci.mli b/parsing_cocci/ast0_cocci.mli
index 470c837f..20d6e40c 100644
--- a/parsing_cocci/ast0_cocci.mli
+++ b/parsing_cocci/ast0_cocci.mli
@@ -445,7 +445,10 @@ and fninfo =
   | FInline of string mcode
   | FAttr of attr
 
-and attr = string mcode
+and base_attr =
+    Attribute of string mcode
+
+and attr = base_attr wrap
 
 and ('a,'b) whencode =
     WhenNot of string mcode (* when *) * string mcode (* != *) * 'a
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
