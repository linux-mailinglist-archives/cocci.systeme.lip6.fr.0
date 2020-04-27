Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC031BA334
	for <lists+cocci@lfdr.de>; Mon, 27 Apr 2020 14:09:27 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03RC8rAd021264;
	Mon, 27 Apr 2020 14:08:53 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E19DA782D;
	Mon, 27 Apr 2020 14:08:52 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E5FEA7769
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 14:08:50 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:443])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03RC8n9T015847
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 14:08:50 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id d184so8924624pfd.4
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 05:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QDOZMP5+Tp1H5p7ZsGPBt9cBYKhAoKEiEgHpCjlZyPg=;
 b=qu2ylTuI84qQ8IY4Piz7tdD0Bo89vfOnZCtJcLqJwjmygA0o9BIxzaGRpXBjat6mKT
 FhoXeIZHwlEl/vUvqiTsBVbHIvRqDigpmrHJEOr0ziIdmgPgjMugxRTVkLAXuJZ+8jQg
 X2O9VDQlGVXdQsbTI7daslOyn1sunm4zCaF/I+Wl33Rwj9pD+7ToYvDOL0bT3tU96W7V
 uiXM5JdaLtzI5l0ORlDptvRPlrlKOREgtTEVvS7GlzOi9wKHJG8obBQVdjQ27N2FeQWN
 2QlWKEn6wAoaij/SxCqWnDryFlCi1B2Bq59Ni1a5nxY+pKhnOUqRViRlZj1XNN/9EoPo
 89hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QDOZMP5+Tp1H5p7ZsGPBt9cBYKhAoKEiEgHpCjlZyPg=;
 b=SrEATz8B+h+CfENoq6/nYMU81JGPOB6IIaxALfmrB6npai/C9FX8Iyh2lhabchJ50V
 FMe/WmDzDigB5Dk1d3A8vn5AwBKI40J/0HZFITfbNvGrx21U6n7qgaBsA5j8eRfyNVaP
 2GfNG1j9meFMle8icz1hOa/6G+sxBD4/eLmOOU1jRkXGI88tI7fdI0QqwUiPb/VjzuvX
 gHcwunziT2Le71iFqb0F6QNJ5jkCiJs2WSQ7gkjBlTVF7t3S1LFdbSdzV8cjvcFLawB4
 hypq8Xdx/h9eVrps3cAU2SfusNWXeXaO7Ft9N+C4papevDSmOn88EXU8F8NBb3hHd1GK
 XY/g==
X-Gm-Message-State: AGi0Pub1WmTUbtJa9Op3O4yrC2MWlRArO9HRGJtOk/B+Nyd4l7f/An4F
 VvdlVUTPLcTPNo9vI5oKytDeheYvBl8=
X-Google-Smtp-Source: APiQypKLaPeHDSsyS2ka8vPzcN1pFv/EmazhoafRDhmiFYgKMn5fCHnLKqxoHXK2N22Q2xKay4KGcg==
X-Received: by 2002:a63:4c1:: with SMTP id 184mr22129446pge.156.1587989327860; 
 Mon, 27 Apr 2020 05:08:47 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:08:46 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:11 +0530
Message-Id: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 27 Apr 2020 14:08:54 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Mon, 27 Apr 2020 14:08:50 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 00/23] cocci: Add parameter attributes to SmPL
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

This patch series aims to add parameter attributes to SmPL, and is a
continuation of the series "cocci: Improve C parsing of attributes"[1].
In [1], parameter attributes were added to the C AST of Coccinelle, but
not to SmPL.

Two test cases are included:

- detect_param_attr: Test case to detect a parameter attribute.

- remove_param_attr: Test case to remove a parameter attribute as per the
  given SmPL.

[1]https://www.mail-archive.com/cocci@systeme.lip6.fr/msg07133.html

Jaskaran Singh (23):
      parsing_cocci: ast0_cocci: Add parameter attributes
      parsing_cocci: parser: Parse Parameter attributes
      parsing_cocci: visitor_ast0: Visit Parameter attributes
      parsing_cocci: arity: Reflect Parameter attributes
      parsing_cocci: check_meta: Reflect Parameter attributes
      parsing_cocci: compute_lines: Reflect Parameter attributes
      parsing_cocci: context_neg: Reflect Parameter attributes
      parsing_cocci: function_prototypes: Reflect Parameter attributes
      parsing_cocci: index: Reflect Parameter attributes
      parsing_cocci: iso_pattern: Reflect Parameter attributes
      parsing_cocci: type_infer: Reflect Parameter attributes
      parsing_cocci: unparse_ast0: Reflect Parameter attributes
      parsing_c: unparse_cocci: Reflect Parameter attributes
      parsing_cocci: ast_cocci: Add Parameter attributes
      parsing_cocci: visitor_ast: Visit Parameter attributes
      parsing_cocci: ast0toast: Reflect Parameter attributes
      parsing_cocci: disjdistr: Reflect Parameter attributes
      parsing_cocci: pretty_print_cocci: Reflect Parameter attributes
      parsing_cocci: unify_ast: Reflect Parameter attributes
      engine: cocci_vs_c: Match Parameter attributes
      ocaml: coccilib: Reflect Parameter attributes
      tests: Add test case for removing parameter attributes
      tests: Add test case to detect parameter attributes

 engine/cocci_vs_c.ml                  |   18 +++++++++---------
 ocaml/coccilib.mli                    |    8 ++++----
 parsing_c/unparse_cocci.ml            |   16 ++++++++++++----
 parsing_cocci/arity.ml                |   17 ++++++++++-------
 parsing_cocci/ast0_cocci.ml           |    4 ++--
 parsing_cocci/ast0_cocci.mli          |    4 ++--
 parsing_cocci/ast0toast.ml            |    7 ++++---
 parsing_cocci/ast_cocci.ml            |    4 ++--
 parsing_cocci/ast_cocci.mli           |    4 ++--
 parsing_cocci/check_meta.ml           |    2 +-
 parsing_cocci/compute_lines.ml        |   15 +++++++++------
 parsing_cocci/context_neg.ml          |   10 ++++++----
 parsing_cocci/disjdistr.ml            |    6 +++---
 parsing_cocci/function_prototypes.ml  |   12 ++++++------
 parsing_cocci/index.ml                |    4 ++--
 parsing_cocci/iso_pattern.ml          |   22 ++++++++++++++++++----
 parsing_cocci/parser_cocci_menhir.mly |    7 ++++---
 parsing_cocci/pretty_print_cocci.ml   |   15 ++++++++++++---
 parsing_cocci/type_infer.ml           |    2 +-
 parsing_cocci/unify_ast.ml            |   14 ++++++++++----
 parsing_cocci/unparse_ast0.ml         |   15 ++++++++++++---
 parsing_cocci/visitor_ast.ml          |   22 +++++++++++++++++-----
 parsing_cocci/visitor_ast0.ml         |   16 ++++++++++------
 tests/detect_param_attr.c             |    3 +++
 tests/detect_param_attr.cocci         |   13 +++++++++++++
 tests/detect_param_attr.res           |    3 +++
 tests/remove_param_attrs.c            |   11 +++++++++++
 tests/remove_param_attrs.cocci        |   13 +++++++++++++
 tests/remove_param_attrs.res          |   11 +++++++++++
 29 files changed, 212 insertions(+), 86 deletions(-)


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
