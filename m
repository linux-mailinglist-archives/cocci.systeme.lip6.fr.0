Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D578218FA2
	for <lists+cocci@lfdr.de>; Wed,  8 Jul 2020 20:22:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 068IMNSb027667;
	Wed, 8 Jul 2020 20:22:23 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4589F781D;
	Wed,  8 Jul 2020 20:22:23 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D322044A7
 for <cocci@systeme.lip6.fr>; Wed,  8 Jul 2020 20:22:20 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 068IMKlI000493
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 8 Jul 2020 20:22:20 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,328,1589234400"; d="scan'208";a="458992389"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 20:22:19 +0200
Date: Wed, 8 Jul 2020 20:22:19 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaran.singh@collabora.com>
In-Reply-To: <20200708130035.26687-1-jaskaran.singh@collabora.com>
Message-ID: <alpine.DEB.2.22.394.2007082007080.2558@hadrien>
References: <20200708130035.26687-1-jaskaran.singh@collabora.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 20:22:24 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 20:22:20 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Shuah Khan <skhan@linuxfoundation.org>, cocci@systeme.lip6.fr,
        Olivier Potin <olivier.potin@collabora.com>
Subject: Re: [Cocci] [PATCH v2 RESEND 00/20] parsing_cocci: Wrap SmPL
	Attributes
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



On Wed, 8 Jul 2020, Jaskaran Singh wrote:

> This patch series aims to wrap the existing attribute type on the SmPL
> side.  Wrapping attributes is necessary to add support for meta
> attributes in SmPL.

Applied.

I would like to take the opportunity to thank Collabora for funding the
completion of this work.  And the Linux Foundation for funding the start
of it.

julia




>
> Changes in v2:
> --------------
> Rebase on gitlab/master:
> 	d0fd4c7dfa70763870914eedee7022fa35f700e2
> 	add quotes on strings before matching regexps
>
> parsing_cocci: arity: Wrap SmPL Attributes
> - Use literal tab wherever suitable
> - Fix space-before-tab errors
>
> Jaskaran Singh (20):
>       parsing_cocci: ast0_cocci: Wrap SmPL Attributes
>       parsing_cocci: parser: Wrap SmPL Attributes
>       parsing_cocci: visitor_ast0: Wrap SmPL Attributes
>       parsing_cocci: adjust_pragmas: Wrap SmPL Attributes
>       parsing_cocci: arity: Wrap SmPL Attributes
>       parsing_cocci: compute_lines: Wrap SmPL Attributes
>       parsing_cocci: context_neg: Wrap SmPL Attributes
>       parsing_cocci: iso_pattern: Wrap SmPL Attributes
>       parsing_cocci: index: Wrap SmPL Attributes
>       parsing_cocci: unparse_ast0: Wrap SmPL Attributes
>       parsing_cocci: ast0toast: Wrap SmPL Attributes
>       parsing_cocci: ast_cocci: Wrap SmPL Attributes
>       parsing_cocci: visitor_ast: Wrap SmPL Attributes
>       parsing_cocci: get_constants2: Wrap SmPL Attributes
>       parsing_cocci: safe_for_multi_decls: Wrap SmPL Attributes
>       parsing_cocci: unify_ast: Wrap SmPL Attributes
>       parsing_cocci: pretty_print_cocci: Wrap SmPL Attributes
>       parsing_c: unparse_cocci: Wrap SmPL Attributes
>       engine: cocci_vs_c: Wrap SmPL Attributes
>       ocaml: coccilib: Wrap SmPL Attributes
>
>  engine/cocci_vs_c.ml                  |   13 +++---
>  ocaml/coccilib.mli                    |   10 ++++-
>  parsing_c/unparse_cocci.ml            |   34 ++++++++---------
>  parsing_cocci/adjust_pragmas.ml       |    9 +++-
>  parsing_cocci/arity.ml                |   55 ++++++++++++---------------
>  parsing_cocci/ast0_cocci.ml           |    5 ++
>  parsing_cocci/ast0_cocci.mli          |    5 ++
>  parsing_cocci/ast0toast.ml            |   21 ++++++----
>  parsing_cocci/ast_cocci.ml            |    5 ++
>  parsing_cocci/ast_cocci.mli           |    5 ++
>  parsing_cocci/compute_lines.ml        |   42 ++++++++++++---------
>  parsing_cocci/context_neg.ml          |   31 ++++++++++-----
>  parsing_cocci/get_constants2.ml       |    6 ++-
>  parsing_cocci/index.ml                |    6 ++-
>  parsing_cocci/index.mli               |    1
>  parsing_cocci/iso_pattern.ml          |   68 +++++++++++++---------------------
>  parsing_cocci/parse_aux.ml            |    3 +
>  parsing_cocci/parse_aux.mli           |    7 +++
>  parsing_cocci/parser_cocci_menhir.mly |   18 +++++----
>  parsing_cocci/pretty_print_cocci.ml   |   34 ++++++++---------
>  parsing_cocci/safe_for_multi_decls.ml |    6 ++-
>  parsing_cocci/unify_ast.ml            |   21 ++++++----
>  parsing_cocci/unparse_ast0.ml         |   34 ++++++++---------
>  parsing_cocci/visitor_ast.ml          |   48 +++++++++++++++---------
>  parsing_cocci/visitor_ast0.ml         |   27 +++++++++----
>  25 files changed, 296 insertions(+), 218 deletions(-)
>
>
>

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
