Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B15222344
	for <lists+cocci@lfdr.de>; Thu, 16 Jul 2020 15:02:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06GD1htF011179;
	Thu, 16 Jul 2020 15:01:43 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1842A7815;
	Thu, 16 Jul 2020 15:01:43 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B94913F6C
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:01:40 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06GD1dIj004933
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:01:40 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 945942A570D
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jul 2020 18:29:51 +0530
Message-Id: <20200716130016.23729-1-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:01:46 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:01:40 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH 00/24] parsing_cocci: Add attributefn to the SmPL
	AST0 visitor
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
to the SmPL AST0 visitor. This is needed to support meta attributes. An
AttributeTag constructor is also added due to dependencies, as well as
to maintain consistency with the codebase.

Jaskaran Singh (24):
      parsing_cocci: visitor_ast0: Add attributefn to SmPL AST0 visitor
      parsing_cocci: ast0toast: Reflect attributefn in AST0 visitor
      parsing_cocci: check_meta: Reflect attributefn in AST0 visitor
      parsing_cocci: function_prototypes: Reflect attributefn in AST0 visitor
      parsing_cocci: iso_compile: Reflect attributefn in AST0 visitor
      parsing_cocci: iso_pattern: Reflect attributefn in AST0 visitor
      parsing_cocci: parse_cocci: Reflect attributefn in AST0 visitor
      parsing_cocci: single_statement: Reflect attributefn in AST0 visitor
      parsing_cocci: unitary_ast0: Reflect attributefn in AST0 visitor
      parsing_cocci: ast0_cocci: Add AttributeTag to SmPL AST0
      parsing_cocci: visitor_ast0: Reflect AttributeTag in SmPL AST0
      parsing_cocci: iso_pattern: Reflect AttributeTag in SmPL AST0
      parsing_cocci: unparse_ast0: Reflect AttributeTag in SmPL AST0
      parsing_cocci: context_neg: Reflect AttributeTag in SmPL AST0
      parsing_cocci: insert_plus: Reflect AttributeTag in SmPL AST0
      parsing_cocci: ast_cocci: Add AttributeTag to the SmPL AST
      parsing_cocci: pretty_print_cocci: Reflect AttributeTag in SmPL AST
      parsing_c: unparse_cocci: Reflect AttributeTag in SmPL AST
      parsing_cocci: visitor_ast: Reflect AttributeTag in SmPL AST
      parsing_cocci: ast0toast: Reflect AttributeTag in the SmPL ASTs
      ocaml: coccilib: Reflect AttributeTag in the SmPL ASTs
      parsing_cocci: context_neg: Reflect attributefn in AST0 visitor
      parsing_cocci: insert_plus: Reflect attributefn in AST0 visitor
      tools: spgen: Reflect attributefn in AST0 visitor

 ocaml/coccilib.mli                   |    2 ++
 parsing_c/unparse_cocci.ml           |    1 +
 parsing_cocci/ast0_cocci.ml          |    2 ++
 parsing_cocci/ast0_cocci.mli         |    2 ++
 parsing_cocci/ast0toast.ml           |    5 +++--
 parsing_cocci/ast0toast.mli          |    1 +
 parsing_cocci/ast_cocci.ml           |    2 ++
 parsing_cocci/ast_cocci.mli          |    1 +
 parsing_cocci/check_meta.ml          |    4 ++--
 parsing_cocci/context_neg.ml         |   23 +++++++++++++++++------
 parsing_cocci/function_prototypes.ml |    6 +++---
 parsing_cocci/insert_plus.ml         |   18 ++++++++++++++----
 parsing_cocci/iso_compile.ml         |    2 +-
 parsing_cocci/iso_pattern.ml         |   17 +++++++++++------
 parsing_cocci/parse_cocci.ml         |    2 +-
 parsing_cocci/pretty_print_cocci.ml  |    1 +
 parsing_cocci/single_statement.ml    |    2 +-
 parsing_cocci/unitary_ast0.ml        |    2 +-
 parsing_cocci/unparse_ast0.ml        |    1 +
 parsing_cocci/visitor_ast.ml         |    2 ++
 parsing_cocci/visitor_ast0.ml        |   24 ++++++++++++++++++++----
 parsing_cocci/visitor_ast0.mli       |    2 ++
 parsing_cocci/visitor_ast0_types.ml  |    6 ++++++
 parsing_cocci/visitor_ast0_types.mli |    6 ++++++
 tools/spgen/source/detect_patch.ml   |    3 ++-
 tools/spgen/source/meta_variable.ml  |    3 ++-
 tools/spgen/source/rule_body.ml      |    3 ++-
 27 files changed, 109 insertions(+), 34 deletions(-)


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
