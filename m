Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF064213F20
	for <lists+cocci@lfdr.de>; Fri,  3 Jul 2020 20:04:09 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 063I2iL2003463;
	Fri, 3 Jul 2020 20:02:44 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id AE200781E;
	Fri,  3 Jul 2020 20:02:44 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 6F1AD3F6C
 for <cocci@systeme.lip6.fr>; Fri,  3 Jul 2020 19:59:53 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 063HxpVa029330
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 3 Jul 2020 19:59:52 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id A11022A64FA
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Fri,  3 Jul 2020 23:29:11 +0530
Message-Id: <20200703175931.1693-1-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 03 Jul 2020 20:02:47 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 03 Jul 2020 19:59:52 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Fri, 03 Jul 2020 20:02:40 +0200
Subject: [Cocci] [PATCH 00/20] parsing_cocci: Wrap SmPL Attributes
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

This patch series aims to wrap the existing attribute type on the SmPL
side.  Wrapping attributes is necessary to add support for meta
attributes in SmPL.

Jaskaran Singh (20):
      parsing_cocci: ast0_cocci: Wrap SmPL Attributes
      parsing_cocci: parser: Wrap SmPL Attributes
      parsing_cocci: visitor_ast0: Wrap SmPL Attributes
      parsing_cocci: adjust_pragmas: Wrap SmPL Attributes
      parsing_cocci: arity: Wrap SmPL Attributes
      parsing_cocci: compute_lines: Wrap SmPL Attributes
      parsing_cocci: context_neg: Wrap SmPL Attributes
      parsing_cocci: iso_pattern: Wrap SmPL Attributes
      parsing_cocci: index: Wrap SmPL Attributes
      parsing_cocci: unparse_ast0: Wrap SmPL Attributes
      parsing_cocci: ast0toast: Wrap SmPL Attributes
      parsing_cocci: ast_cocci: Wrap SmPL Attributes
      parsing_cocci: visitor_ast: Wrap SmPL Attributes
      parsing_cocci: get_constants2: Wrap SmPL Attributes
      parsing_cocci: safe_for_multi_decls: Wrap SmPL Attributes
      parsing_cocci: unify_ast: Wrap SmPL Attributes
      parsing_cocci: pretty_print_cocci: Wrap SmPL Attributes
      parsing_c: unparse_cocci: Wrap SmPL Attributes
      engine: cocci_vs_c: Wrap SmPL Attributes
      ocaml: coccilib: Wrap SmPL Attributes

 engine/cocci_vs_c.ml                  |   26 +++---
 ocaml/coccilib.mli                    |   20 ++++-
 parsing_c/unparse_cocci.ml            |   68 ++++++++---------
 parsing_cocci/adjust_pragmas.ml       |   18 +++-
 parsing_cocci/arity.ml                |  134 +++++++++++++++------------------
 parsing_cocci/ast0_cocci.ml           |    5 +
 parsing_cocci/ast0_cocci.mli          |    5 +
 parsing_cocci/ast0toast.ml            |   42 ++++++----
 parsing_cocci/ast_cocci.ml            |   10 ++
 parsing_cocci/ast_cocci.mli           |   10 ++
 parsing_cocci/compute_lines.ml        |   84 ++++++++++++---------
 parsing_cocci/context_neg.ml          |   62 ++++++++++-----
 parsing_cocci/get_constants2.ml       |   12 ++-
 parsing_cocci/index.ml                |   12 ++-
 parsing_cocci/index.mli               |    2 
 parsing_cocci/iso_pattern.ml          |  136 +++++++++++++---------------------
 parsing_cocci/parse_aux.ml            |    6 +
 parsing_cocci/parse_aux.mli           |   14 +++
 parsing_cocci/parser_cocci_menhir.mly |   36 +++++----
 parsing_cocci/pretty_print_cocci.ml   |   68 ++++++++---------
 parsing_cocci/safe_for_multi_decls.ml |   12 ++-
 parsing_cocci/unify_ast.ml            |   42 ++++++----
 parsing_cocci/unparse_ast0.ml         |   68 ++++++++---------
 parsing_cocci/visitor_ast.ml          |   96 +++++++++++++++---------
 parsing_cocci/visitor_ast0.ml         |   54 +++++++++----
 25 files changed, 596 insertions(+), 446 deletions(-)


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
