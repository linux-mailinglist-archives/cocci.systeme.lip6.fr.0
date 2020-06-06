Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 401551F06DD
	for <lists+cocci@lfdr.de>; Sat,  6 Jun 2020 16:02:07 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 056E1lgm020008;
	Sat, 6 Jun 2020 16:01:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2319C777D;
	Sat,  6 Jun 2020 16:01:47 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9AE7E3BAB
 for <cocci@systeme.lip6.fr>; Sat,  6 Jun 2020 16:01:45 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 056E1iH1006122
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 6 Jun 2020 16:01:45 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,480,1583190000"; d="scan'208";a="350774215"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2020 16:01:44 +0200
Date: Sat, 6 Jun 2020 16:01:44 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200606135342.12584-1-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2006061601340.10333@hadrien>
References: <20200529120703.31145-24-jaskaransingh7654321@gmail.com>
 <20200606135342.12584-1-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 06 Jun 2020 16:01:47 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 06 Jun 2020 16:01:45 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH v4 23/32] parsing_c: type_annoter_c: Reflect
 Cast attributes
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



On Sat, 6 Jun 2020, Jaskaran Singh wrote:

> Cast attributes are added to the SmPL AST. Reflect these changes in
> type_annoter_c.ml.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
> Changes in v4:
> - Change 't, e, a' to 't, a, e' in the Cast constructor for
>   consistency

Thanks!

julia

>
> Changes in v3:
> Rebase as follows:
>         v3 of "cocci: Add Parameter attributes to SmPL"[2]
>         v3 of "cocci: Improve C parsing of attributes"[3]
>         gitlab master branch (ffb87d9d)
>
> Changes in v2:
> parsing_c: parser: Pass attribute list from type_name
> - Warn about dropped attributes in typeof and sizeof productions
>
> parsing_cocci: parser: Parse cast attributes
> - Mention in commit message that cast attributes are matched anywhere
>   in a cast.
>
> parsing_cocci: arity: Reflect Cast attributes
> - Apply mcode2arity on attributes as well.
>
> parsing_cocci: visitor_ast: Visit cast attributes
> - Typo in commit message (AST0 -> AST).
>
> parsing_c: pretty_print_c: Reflect Cast attributes
> - Less space in front of [
>
> parsing_c: ast_c: Add Cast attributes
> - Switch places of expression and attributes in Cast type.
>
> parsing_c: parser: Parse Cast attributes
> - Switch places of expression and attributes in Cast type.
>
> parsing_c: pretty_print_c: Reflect Cast attributes
> - Switch places of expression and attributes in Cast type.
> - Change printing order of cast elements.
>
> parsing_c: type_annoter_c: Reflect Cast attributes
> - Switch places of expression and attributes in Cast type.
>
> parsing_c: visitor_c: Visit Cast attributes
> - Switch places of expression and attributes in Cast type.
> - Change visitor order of cast elements.
>
> engine: cocci_vs_c: Match Cast attributes
> - Switch places of expression and attributes in C AST Cast type.
>
> ocaml: coccilib: Reflect Cast attributes
> - Switch places of expression and attributes in C AST Cast type.
>
>
>  parsing_c/type_annoter_c.ml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/parsing_c/type_annoter_c.ml b/parsing_c/type_annoter_c.ml
> index dfd363b2..25cb6c0e 100644
> --- a/parsing_c/type_annoter_c.ml
> +++ b/parsing_c/type_annoter_c.ml
> @@ -525,7 +525,7 @@ let rec is_simple_expr expr =
>        true
>    | Binary (e1, op, e2) ->
>        true
> -  | Cast (t, e) ->
> +  | Cast (t, a, e) ->
>        true
>    | ParenExpr (e) -> is_simple_expr e
>
> @@ -961,7 +961,7 @@ let annotater_expr_visitor_subpart = (fun (k,bigf) expr ->
>
>
>      (* -------------------------------------------------- *)
> -    | Cast (t, e) ->
> +    | Cast (t, a, e) ->
>          k expr;
>          (* todo: if infer, can "push" info ? add_types_expr [t] e ? *)
>          make_info_def_fix (Lib.al_type t)
> --
> 2.21.1
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
