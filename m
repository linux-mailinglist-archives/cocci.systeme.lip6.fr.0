Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC48818A17D
	for <lists+cocci@lfdr.de>; Wed, 18 Mar 2020 18:25:50 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02IHPLN2018058;
	Wed, 18 Mar 2020 18:25:21 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4707C781F;
	Wed, 18 Mar 2020 18:25:21 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 27D9D77F9
 for <cocci@systeme.lip6.fr>; Wed, 18 Mar 2020 18:25:19 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02IHPHRe008507
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 18 Mar 2020 18:25:18 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,568,1574118000"; d="scan'208";a="342837055"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 18:25:17 +0100
Date: Wed, 18 Mar 2020 18:25:17 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200316100319.27935-2-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2003181823000.2979@hadrien>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
 <20200316100319.27935-2-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 18 Mar 2020 18:25:23 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 18 Mar 2020 18:25:18 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 01/26] parsing_cocci: Add Function Prototype
	token
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



On Mon, 16 Mar 2020, Jaskaran Singh wrote:

> To add the types ParenType and FunctionType to the SmPL AST, a
> reduce/reduce conflict with the funproto rule of the SmPL parser
> must be resolved. This requires explicitly identifying a function
> prototype by use of a token (TFunProto).
>
> While the correct method of identifying a function prototype would be to
> check if an identifier is preceded by a return type, it is challenging
> to implement. This is because implementing an OCaml function, to
> correctly determine a C type in SmPL, without the aid of Yacc, would
> have to handle a number of cases (disjunctions, typeof expressions,
> etc.).
>
> Thus, a slightly hacky approach is taken to determine a function
> prototype with not the best certainty but what works for most cases
> in SmPL. If the identifier is preceded by any token that does not
> seem to be part of a type, then it is not identified as a function
> prototype. Else, it is.

This sacrifices the test case tests/p1p2.cocci:

@@
typedef Error;
type T;
identifier FN;
parameter P1;
@@
 T
+__attribute__((nonnull(1)))
 FN(P1, Error **errp);

@@
typedef Error;
type T;
identifier FN;
parameter P1;
parameter P2;
@@
 T
+__attribute__((nonnull(2)))
 FN(P1, P2, Error **errp);

Normally, the only way that you can have a ) before a function call is
when there is a cast.  But hopefully in that case there would not be two
)) before the function call.  Can that get around the problem?

julia




>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_cocci/parse_cocci.ml          | 72 +++++++++++++++++++++++----
>  parsing_cocci/parser_cocci_menhir.mly |  9 ++--
>  2 files changed, 67 insertions(+), 14 deletions(-)
>
> diff --git a/parsing_cocci/parse_cocci.ml b/parsing_cocci/parse_cocci.ml
> index 679d213a..4b2cb7e4 100644
> --- a/parsing_cocci/parse_cocci.ml
> +++ b/parsing_cocci/parse_cocci.ml
> @@ -295,6 +295,7 @@ let token2c (tok,_) add_clt =
>    | PC.TLineEnd(clt) -> "line end"
>    | PC.TInvalid -> "invalid"
>    | PC.TFunDecl(clt) -> "fundecl"
> +  | PC.TFunProto(clt) -> "funproto"
>
>    | PC.TIso -> "<=>"
>    | PC.TRightIso -> "=>"
> @@ -480,7 +481,7 @@ let get_clt (tok,_) =
>
>    | PC.TOPar0(_,clt) | PC.TMid0(_,clt) | PC.TAnd0(_,clt) | PC.TCPar0(_,clt)
>    | PC.TOEllipsis(clt) | PC.TCEllipsis(clt)
> -  | PC.TPOEllipsis(clt) | PC.TPCEllipsis(clt)
> +  | PC.TPOEllipsis(clt) | PC.TPCEllipsis(clt) | PC.TFunProto(clt)
>    | PC.TFunDecl(clt) | PC.TDirective(_,clt) | PC.TAttr_(clt)
>    | PC.TLineEnd(clt) -> clt
>    | PC.TVAEllipsis(clt) -> clt
> @@ -718,6 +719,7 @@ let update_clt (tok,x) clt =
>
>    | PC.TLineEnd(_) -> (PC.TLineEnd(clt),x)
>    | PC.TFunDecl(_) -> (PC.TFunDecl(clt),x)
> +  | PC.TFunProto(_) -> (PC.TFunProto(clt),x)
>    | PC.TTildeExclEq(_) -> (PC.TTildeExclEq(clt),x)
>    | PC.TDirective(a,_) -> (PC.TDirective(a,clt),x)
>    | PC.TAttr_(_) -> (PC.TAttr_(clt),x)
> @@ -925,7 +927,7 @@ let split_token ((tok,_) as t) =
>    | PC.TInitialize | PC.TFinalize -> ([t],[t])
>    | PC.TPArob clt | PC.TMetaPos(_,_,_,clt) | PC.TMetaCom(_,_,clt) -> split t clt
>
> -  | PC.TFunDecl(clt)
> +  | PC.TFunDecl(clt) | PC.TFunProto(clt)
>    | PC.TWhen(clt) | PC.TWhenTrue(clt) | PC.TWhenFalse(clt)
>    | PC.TAny(clt) | PC.TStrict(clt) | PC.TLineEnd(clt)
>    | PC.TEllipsis(clt)
> @@ -1006,7 +1008,8 @@ let find_function_names l =
>      | _ -> false in
>    let rec split acc = function
>        [] | [_] -> raise Irrelevant
> -    | ((PC.TCPar(_),_) as t1) :: ((PC.TOBrace(_),_) as t2) :: rest ->
> +    | ((PC.TCPar(_),_) as t1) :: ((PC.TOBrace(_),_) as t2) :: rest
> +    | ((PC.TCPar(_),_) as t1) :: ((PC.TPtVirg(_),_) as t2) :: rest ->
>  	(List.rev (t1::acc),(t2::rest))
>      | x::xs -> split (x::acc) xs in
>    let rec balanced_name level = function
> @@ -1037,7 +1040,48 @@ let find_function_names l =
>      | (PC.TArobArob,_)::_ | (PC.TArob,_)::_ | (PC.EOF,_)::_ ->
>  	raise Irrelevant
>      | t::rest -> balanced_args level rest in
> -  let rec loop = function
> +  let rec is_permissible_proto = function
> +      [] -> false
> +    | (PC.TCPar0(_),_)::
> +      ((PC.TMid0(_),_) | (PC.TAnd0(_),_))::
> +      (PC.TOPar0(_),_)::_ -> false
> +    | (PC.TOPar0(_),_)::rest
> +    | (PC.TCPar0(_),_)::rest -> is_permissible_proto rest
> +    | x::rest when is_mid x ->
> +        let rec loop = function
> +          [] -> false
> +        | (PC.TOPar0(_),_)::xs -> is_permissible_proto xs
> +        | x::xs -> loop xs in
> +        loop rest
> +    | _::((PC.TEq(_),_) | (PC.TNotEq(_),_))::(PC.TWhen(_),_)::_
> +    | _::(PC.TWhen(_),_)::_
> +    | (PC.TComma(_),_)::_
> +    | (PC.TDirective(_),_)::_
> +    | (PC.TElse(_),_)::_
> +    | (PC.TReturn(_),_)::_
> +    | (PC.TMetaStm(_),_)::_
> +    | (PC.TMetaExp(_),_)::_
> +    | (PC.TMetaId(_),_)::_
> +    | (PC.TMetaLocalIdExp(_),_)::_
> +    | (PC.TEq(_),_)::_
> +    | (PC.TEllipsis(_),_)::_
> +    | (PC.TOEllipsis(_),_)::_
> +    | (PC.TCEllipsis(_),_)::_
> +    | (PC.TPOEllipsis(_),_)::_
> +    | (PC.TPCEllipsis(_),_)::_
> +    | (PC.TPtVirg(_),_)::_
> +    | (PC.TOBrace(_),_)::_
> +    | (PC.TCBrace(_),_)::_
> +    | (PC.TOPar(_),_)::_
> +    | (PC.TCPar(_),_)::_
> +    | (PC.TIdent(_),_)::_ -> false
> +    | _ -> true in
> +  let decl_or_proto clt info bef aft =
> +    match aft with
> +      (PC.TOBrace(_),_)::_ -> (((PC.TFunDecl(clt),info) :: bef), aft)
> +    | (PC.TPtVirg(_),_)::_ -> (((PC.TFunProto(clt),info) :: bef), aft)
> +    | _ -> raise Irrelevant in
> +  let rec loop acc = function
>        [] -> []
>      | t :: rest ->
>  	if is_par t || is_mid t || is_ident t
> @@ -1046,26 +1090,30 @@ let find_function_names l =
>  	    try
>  	      let (bef,aft) = split [] (t::rest) in
>  	      let rest = balanced_name 0 bef in
> +              (match aft with
> +                (PC.TPtVirg(_),_)::_
> +                 when not(is_permissible_proto acc) -> raise Irrelevant
> +              | _ ->
>  	      (match rest with
>  		(PC.TOPar(_),_)::_ ->
>  		  (match balanced_args 0 rest with
>  		    [] ->
>  		      let (_,info) as h = List.hd bef in
>  		      let clt = get_clt h in
> -		      (((PC.TFunDecl(clt),info) :: bef), aft)
> +                      decl_or_proto clt info bef aft
>  		  | (PC.TAttr_(_),_)::rest ->
>  		      (match balanced_args 0 rest with
>  			[] ->
>  			  let (_,info) as h = List.hd bef in
>  			  let clt = get_clt h in
> -			  (((PC.TFunDecl(clt),info) :: bef), aft)
> +                          decl_or_proto clt info bef aft
>  		      | _ -> raise Irrelevant)
>  		  | _ -> raise Irrelevant)
> -	      | _ -> raise Irrelevant)
> +	      | _ -> raise Irrelevant))
>  	    with Irrelevant -> ([t],rest) in
> -	  t @ (loop rest)
> -	else t :: (loop rest) in
> -  loop l
> +          t @ (loop (t @ acc) rest)
> +        else t :: (loop (t :: acc) rest) in
> +  loop [] l
>
>  (* ----------------------------------------------------------------------- *)
>  (* an attribute is an identifier that precedes another identifier and
> @@ -1168,6 +1216,8 @@ let detect_types in_meta_decls l =
>  	delim::newid::id::(loop false infn (ident::type_names) rest)
>      | ((PC.TFunDecl(_),_) as fn)::rest ->
>  	fn::(loop false 1 type_names rest)
> +    | ((PC.TFunProto(_),_) as fn)::rest ->
> +	fn::(loop false 1 type_names rest)
>      | ((PC.TOPar(_),_) as lp)::rest when infn > 0 ->
>  	lp::(loop false (infn + 1) type_names rest)
>      | ((PC.TCPar(_),_) as rp)::rest when infn > 0 ->
> @@ -1252,7 +1302,7 @@ let token2line (tok,_) =
>    | PC.TMetaDParamList(_,_,_,_,clt) | PC.TMetaFunc(_,_,_,clt)
>    | PC.TMetaLocalFunc(_,_,_,clt) | PC.TMetaPos(_,_,_,clt) | PC.TMetaCom(_,_,clt)
>
> -  | PC.TFunDecl(clt)
> +  | PC.TFunDecl(clt) | PC.TFunProto(clt)
>    | PC.TWhen(clt) | PC.TWhenTrue(clt) | PC.TWhenFalse(clt)
>    | PC.TAny(clt) | PC.TStrict(clt) | PC.TEllipsis(clt)
>
> diff --git a/parsing_cocci/parser_cocci_menhir.mly b/parsing_cocci/parser_cocci_menhir.mly
> index 9e6c8a08..26958f63 100644
> --- a/parsing_cocci/parser_cocci_menhir.mly
> +++ b/parsing_cocci/parser_cocci_menhir.mly
> @@ -239,7 +239,8 @@ let inline_id aft = function
>
>  %token <Data.clt> TVAEllipsis
>  %token <Data.clt> TIf TElse TWhile TFor TDo TSwitch TCase TDefault TReturn
> -%token <Data.clt> TBreak TContinue TGoto TSizeof TTypeof TFunDecl Tdecimal Texec
> +%token <Data.clt> TBreak TContinue TGoto TSizeof TTypeof TFunDecl TFunProto
> +%token <Data.clt> Tdecimal Texec
>  %token <string * Data.clt> TIdent TTypeId TDeclarerId TIteratorId TSymId
>  %token <Ast_cocci.added_string * Data.clt> TDirective
>  %token <Data.clt> TAttr_
> @@ -1439,7 +1440,8 @@ reverse_separated_nonempty_llist(separator, X):
>
>  funproto:
>    s=ioption(storage) i=ioption(Tinline) t=ctype
> -  id=fn_ident lp=TOPar arglist=arg_list(name_opt_decl) rp=TCPar pt=TPtVirg
> +  TFunProto id=fn_ident
> +  lp=TOPar arglist=arg_list(name_opt_decl) rp=TCPar pt=TPtVirg
>        { let s = match s with None -> [] | Some s -> [Ast0.FStorage s] in
>          let i =
>  	  match i with
> @@ -1453,7 +1455,8 @@ funproto:
>  	      P.clt2mcode "(" lp, args, vararg, P.clt2mcode ")" rp,
>  	      P.clt2mcode ";" pt)) }
>  | i=Tinline s=storage t=ctype
> -  id=fn_ident lp=TOPar arglist=arg_list(name_opt_decl) rp=TCPar pt=TPtVirg
> +  TFunProto id=fn_ident
> +  lp=TOPar arglist=arg_list(name_opt_decl) rp=TCPar pt=TPtVirg
>        { let s = [Ast0.FStorage s] in
>          let i = [Ast0.FInline (P.clt2mcode "inline" i)] in
>  	let t = [Ast0.FType t] in
> --
> 2.21.1
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
