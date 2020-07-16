Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA749222366
	for <lists+cocci@lfdr.de>; Thu, 16 Jul 2020 15:03:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06GD2FRP026700;
	Thu, 16 Jul 2020 15:02:15 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E08E03F6C;
	Thu, 16 Jul 2020 15:02:14 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B536A3F6C
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:02:10 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06GD2AER029252
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:02:10 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 2A2A42A2BDE
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jul 2020 18:30:12 +0530
Message-Id: <20200716130016.23729-22-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200716130016.23729-1-jaskaran.singh@collabora.com>
References: <20200716130016.23729-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:02:15 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 16 Jul 2020 15:02:10 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] [PATCH 21/24] ocaml: coccilib: Reflect AttributeTag in the
	SmPL ASTs
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

AttributeTag is added to the SmPL ASTs. Reflect these changes in
coccilib.mli.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 ocaml/coccilib.mli | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ocaml/coccilib.mli b/ocaml/coccilib.mli
index 010b8aab..19f1512c 100644
--- a/ocaml/coccilib.mli
+++ b/ocaml/coccilib.mli
@@ -3078,6 +3078,7 @@ module Ast_cocci :
       | ForInfoTag of forinfo
       | CaseLineTag of case_line
       | StringFragmentTag of string_fragment
+      | AttributeTag of attr
       | ConstVolTag of const_vol
       | Token of string * info option
       | Directive of added_string list
@@ -3660,6 +3661,7 @@ module Ast0_cocci :
       | ForInfoTag of forinfo
       | CaseLineTag of case_line
       | StringFragmentTag of string_fragment
+      | AttributeTag of attr
       | TopTag of top_level
       | IsoWhenTag of Ast_cocci.when_modifier
       | IsoWhenTTag of expression
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
