Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F911C2EC2
	for <lists+cocci@lfdr.de>; Sun,  3 May 2020 21:26:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 043JQ9cr015174;
	Sun, 3 May 2020 21:26:09 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 459647828;
	Sun,  3 May 2020 21:26:09 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 193B83C89
 for <cocci@systeme.lip6.fr>; Sun,  3 May 2020 21:26:08 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 043JQ7VT016879
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 3 May 2020 21:26:07 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,349,1583190000"; d="scan'208";a="347593809"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2020 21:26:07 +0200
Date: Sun, 3 May 2020 21:26:07 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200428170228.7002-4-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2005032125380.2533@hadrien>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
 <20200428170228.7002-4-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 03 May 2020 21:26:09 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 03 May 2020 21:26:07 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 03/32] parsing_cocci: parser: Parse cast
	attributes
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



On Tue, 28 Apr 2020, Jaskaran Singh wrote:

> Cast attributes are added to the SmPL ASTs. Parse these attributes in
> the SmPL parser and place them in the SmPL AST. The added production
> only supports attributes after the type and before the expression.

It would be good to say that on matching the attributes will be searched
for anywhere, if that is the case.

julia

>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_cocci/parser_cocci_menhir.mly | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/parsing_cocci/parser_cocci_menhir.mly b/parsing_cocci/parser_cocci_menhir.mly
> index db5661bd..38b0e039 100644
> --- a/parsing_cocci/parser_cocci_menhir.mly
> +++ b/parsing_cocci/parser_cocci_menhir.mly
> @@ -2176,11 +2176,12 @@ arith_expr_bis:
>
>  cast_expr(r,pe):
>      unary_expr(r,pe)                      { $1 }
> -  | lp=TOPar t=ctype rp=TCPar e=cast_expr(r,pe)
> -      { Ast0.wrap(Ast0.Cast (P.clt2mcode "(" lp, t,
> +  | lp=TOPar t=ctype ar=attr_list rp=TCPar e=cast_expr(r,pe)
> +      { Ast0.wrap(Ast0.Cast (P.clt2mcode "(" lp, t, ar,
>                               P.clt2mcode ")" rp, e)) }
> -  | lp=TOPar t=ctype d=direct_abstract_d rp=TCPar e=cast_expr(r,pe)
> -      { Ast0.wrap(Ast0.Cast (P.clt2mcode "(" lp, d t,
> +  | lp=TOPar t=ctype d=direct_abstract_d ar=attr_list rp=TCPar
> +    e=cast_expr(r,pe)
> +      { Ast0.wrap(Ast0.Cast (P.clt2mcode "(" lp, d t, ar,
>  			     P.clt2mcode ")" rp, e)) }
>
>  unary_expr(r,pe):
> --
> 2.21.1
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
