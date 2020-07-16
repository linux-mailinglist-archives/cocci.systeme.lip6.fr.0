Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEE1222378
	for <lists+cocci@lfdr.de>; Thu, 16 Jul 2020 15:06:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06GD5c7I024632;
	Thu, 16 Jul 2020 15:05:38 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 809197815;
	Thu, 16 Jul 2020 15:05:38 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 183933F6C
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:05:37 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06GD5att018489
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:05:36 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 416632A0BFF
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jul 2020 18:35:04 +0530
Message-Id: <20200716130521.7717-1-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:05:38 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:05:36 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH 00/17] parsing_cocci: Add attributefn to the SmPL
	AST visitor
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

This patch series aims to add a public function for visiting attributes
to the SmPL AST visitor. This is needed to support meta attributes.

Jaskaran Singh (17):
      parsing_cocci: visitor_ast: Add attributefn to SmPL AST visitor
      parsing_cocci: parse_cocci: Reflect attributefn in AST visitor
      parsing_cocci: cleanup_rules: Reflect attributefn in AST visitor
      parsing_cocci: disjdistr: Reflect attributefn in AST visitor
      parsing_cocci: free_vars: Reflect attributefn in AST visitor
      parsing_cocci: get_constants2: Reflect attributefn in AST visitor
      parsing_cocci: re_constraints: Reflect attributefn in AST visitor
      parsing_cocci: safe_for_multi_decls: Reflect attributefn in AST visitor
      parsing_cocci: stmtlist: Reflect attributefn in AST visitor
      parsing_cocci: unify_ast: Reflect attributefn in AST visitor
      parsing_c: unparse_hrule: Reflect attributefn in AST visitor
      cocci: Reflect attributefn in AST visitor
      engine: asttoctl2: Reflect attributefn in AST visitor
      engine: asttomember: Reflect attributefn in AST visitor
      engine: cocci_vs_c: Reflect attributefn in AST visitor
      engine: transformation_c: Reflect attributefn in AST visitor
      popl09: popltoctl: Reflect attributefn in AST visitor

 cocci.ml                              |    2 +-
 engine/asttoctl2.ml                   |   11 ++++++-----
 engine/asttomember.ml                 |    8 ++++----
 engine/cocci_vs_c.ml                  |    4 ++--
 engine/transformation_c.ml            |    2 +-
 parsing_c/unparse_hrule.ml            |    2 +-
 parsing_cocci/cleanup_rules.ml        |    2 +-
 parsing_cocci/disjdistr.ml            |    5 +++--
 parsing_cocci/free_vars.ml            |   16 +++++++++-------
 parsing_cocci/get_constants2.ml       |    3 ++-
 parsing_cocci/parse_cocci.ml          |    2 +-
 parsing_cocci/re_constraints.ml       |    8 +++++---
 parsing_cocci/safe_for_multi_decls.ml |    6 +++---
 parsing_cocci/stmtlist.ml             |    2 +-
 parsing_cocci/unify_ast.ml            |   20 +++++++++++++-------
 parsing_cocci/visitor_ast.ml          |   12 ++++++++----
 parsing_cocci/visitor_ast.mli         |    4 ++++
 popl09/popltoctl.ml                   |    2 +-
 18 files changed, 66 insertions(+), 45 deletions(-)


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
