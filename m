Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5911BAACB
	for <lists+cocci@lfdr.de>; Mon, 27 Apr 2020 19:09:33 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03RH9JGn018484;
	Mon, 27 Apr 2020 19:09:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2238C782D;
	Mon, 27 Apr 2020 19:09:19 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E779A7769
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 19:09:16 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03RH9Gx4009118
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 19:09:16 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,324,1583190000"; d="scan'208";a="347098204"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 19:09:16 +0200
Date: Mon, 27 Apr 2020 19:09:15 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200427120834.380-13-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2004271907590.12657@hadrien>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
 <20200427120834.380-13-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 27 Apr 2020 19:09:19 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 27 Apr 2020 19:09:16 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 12/23] parsing_cocci: unparse_ast0: Reflect
 Parameter attributes
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



On Mon, 27 Apr 2020, Jaskaran Singh wrote:

> Parameter attributes are added to the SmPL AST. Reflect these changes in
> unparse_ast0.ml.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_cocci/unparse_ast0.ml | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/parsing_cocci/unparse_ast0.ml b/parsing_cocci/unparse_ast0.ml
> index fdaf6cfa..738549fd 100644
> --- a/parsing_cocci/unparse_ast0.ml
> +++ b/parsing_cocci/unparse_ast0.ml
> @@ -546,9 +546,18 @@ and parameterTypeDef p =
>    print_context p
>      (function _ ->
>        match Ast0.unwrap p with
> -	Ast0.VoidParam(ty) -> typeC ty
> -      | Ast0.Param(ty,Some id) -> print_named_type ty id
> -      |	Ast0.Param(ty,None) -> typeC ty
> +        Ast0.VoidParam(ty,attr) ->
> +          typeC ty;
> +	  (if (attr = []) then print_string " ");
> +	  print_between (fun _ -> print_string " ") (mcode print_string) attr;
> +      | Ast0.Param(ty,Some id,attr) ->
> +          print_named_type ty id;
> +	  (if (attr = []) then print_string " ");
> +	  print_between (fun _ -> print_string " ") (mcode print_string) attr;
> +      |	Ast0.Param(ty,None,attr) ->
> +          typeC ty;
> +	  (if (attr = []) then print_string " ");
> +	  print_between (fun _ -> print_string " ") (mcode print_string) attr;

There is some unpleasant alignment in the code above.  After the | there
should be a space not a tab, and the subsequent lines should use tabs if
possible.  You didn't introduce these problems, but since you are changing
these lines, you may as well make these changes as well.

julia

>        | Ast0.MetaParam(name,_,_) -> mcode print_meta name
>        | Ast0.MetaParamList(name,_,_,_) -> mcode print_meta name
>        | Ast0.PComma(cm) -> mcode print_string cm; print_space()
> --
> 2.21.1
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
