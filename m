Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 330591C2EC5
	for <lists+cocci@lfdr.de>; Sun,  3 May 2020 21:30:17 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 043JTsq8019085;
	Sun, 3 May 2020 21:29:54 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 491357828;
	Sun,  3 May 2020 21:29:54 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id BC47F3C89
 for <cocci@systeme.lip6.fr>; Sun,  3 May 2020 21:29:52 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 043JTqAl013135
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 3 May 2020 21:29:52 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,349,1583190000"; d="scan'208";a="347593932"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2020 21:29:51 +0200
Date: Sun, 3 May 2020 21:29:51 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200428170228.7002-16-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2005032129380.2533@hadrien>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
 <20200428170228.7002-16-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 03 May 2020 21:29:54 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 03 May 2020 21:29:52 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 15/32] parsing_cocci: visitor_ast: Visit cast
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

> Cast attributes are added to AST0 of SmPL. Visit these attributes in the

AST0 -> AST

julia

> SmPL AST visitor.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_cocci/visitor_ast.ml | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/parsing_cocci/visitor_ast.ml b/parsing_cocci/visitor_ast.ml
> index 8e530114..644bcd5d 100644
> --- a/parsing_cocci/visitor_ast.ml
> +++ b/parsing_cocci/visitor_ast.ml
> @@ -198,12 +198,13 @@ let combiner bind option_default
>  	  let lar = string_mcode ar in
>  	  let lfield = ident field in
>  	  multibind [lexp; lar; lfield]
> -      | Ast.Cast(lp,ty,rp,exp) ->
> +      | Ast.Cast(lp,ty,attr,rp,exp) ->
>  	  let llp = string_mcode lp in
>  	  let lty = fullType ty in
> +	  let lattr = multibind (List.map string_mcode attr) in
>  	  let lrp = string_mcode rp in
>  	  let lexp = expression exp in
> -	  multibind [llp; lty; lrp; lexp]
> +          multibind [llp; lty; lattr; lrp; lexp]
>        | Ast.SizeOfExpr(szf,exp) ->
>  	  let lszf = string_mcode szf in
>  	  let lexp = expression exp in
> @@ -1184,12 +1185,13 @@ let rebuilder
>  	    let lar = string_mcode ar in
>  	    let lfield = ident field in
>  	    Ast.RecordPtAccess(lexp, lar, lfield)
> -	| Ast.Cast(lp,ty,rp,exp) ->
> +	| Ast.Cast(lp,ty,attr,rp,exp) ->
>  	    let llp = string_mcode lp in
>  	    let lty = fullType ty in
> +	    let lattr = List.map string_mcode attr in
>  	    let lrp = string_mcode rp in
>  	    let lexp = expression exp in
> -	    Ast.Cast(llp, lty, lrp, lexp)
> +	    Ast.Cast(llp, lty, lattr, lrp, lexp)
>  	| Ast.SizeOfExpr(szf,exp) ->
>  	    let lszf = string_mcode szf in
>  	    let lexp = expression exp in
> --
> 2.21.1
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
